resource "google_cloud_run_service" "privatebin" {
  name     = "privatebin"
  location = data.google_client_config.current.region

  provider = google-beta

  template {
    spec {
      service_account_name  = google_service_account.privatebin.email
      container_concurrency = 5
      containers {
        image = var.image
        volume_mounts {
          name       = "config"
          mount_path = "/cloudcfg"
        }
        env {
          name  = "CONFIG_PATH"
          value = "/cloudcfg"
        }
      }
      volumes {
        name = "config"
        secret {
          secret_name = element(reverse(split("/", google_secret_manager_secret.privatebin.name)), 0)
          items {
            key  = element(reverse(split("/", google_secret_manager_secret_version.privatebin.name)), 0)
            path = "conf.php"
          }
        }
      }
    }
  }

  metadata {
    annotations = {
      "run.googleapis.com/launch-stage" = "BETA"
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  autogenerate_revision_name = true
}

resource "google_storage_bucket" "privatebin" {
  name          = format("privatebin-%s", data.google_client_config.current.project)
  location      = data.google_client_config.current.region
  force_destroy = true
}

resource "google_service_account" "privatebin" {
  account_id   = "privatebin"
  display_name = "PrivateBin"
}


resource "google_storage_bucket_iam_binding" "privatebin_object_admin" {
  bucket = google_storage_bucket.privatebin.name
  role   = "roles/storage.objectAdmin"
  members = [
    format("serviceAccount:%s", google_service_account.privatebin.email),
  ]
}

resource "google_cloud_run_service_iam_binding" "run_invoker" {
  location = google_cloud_run_service.privatebin.location
  project  = google_cloud_run_service.privatebin.project
  service  = google_cloud_run_service.privatebin.name
  role     = "roles/run.invoker"
  members = [
    "allUsers",
  ]
}

resource "google_secret_manager_secret" "privatebin" {
  secret_id = "privatebin-configuration"

  replication {
    automatic = true
  }
}


resource "google_secret_manager_secret_iam_binding" "privatebin_accessor" {
  project   = google_secret_manager_secret.privatebin.project
  secret_id = google_secret_manager_secret.privatebin.id
  role      = "roles/secretmanager.secretAccessor"
  members = [
    format("serviceAccount:%s", google_service_account.privatebin.email)
  ]
}

resource "google_secret_manager_secret_version" "privatebin" {
  secret      = google_secret_manager_secret.privatebin.id
  secret_data = <<EOF
[main]
name = "Google PrivateBin"
discussion = true
opendiscussion = false
password = true
fileupload = true
burnafterreadingselected = false
defaultformatter = "plaintext"
sizelimit = 10485760
template = "bootstrap"
languageselection = false

[expire]
default = "1day"

[expire_options]
5min = 300
10min = 600
1hour = 3600
1day = 86400
1week = 604800
1month = 2592000

[formatter_options]
plaintext = "Plain Text"
syntaxhighlighting = "Source Code"
markdown = "Markdown"

[traffic]
limit = 0

[purge]
limit = 600
batchsize = 10

[model]
class = GoogleCloudStorage

[model_options]
bucket = "${google_storage_bucket.privatebin.name}"
EOF 
}

