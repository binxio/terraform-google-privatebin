provider "google" {}
provider "google-beta" {}


module "privatebin" {
  source = "git::https:/github.com/binxio/terraform-google-privatebin.git?ref=0.1.0"

  providers = {
    google      = google
    google-beta = google-beta
  }
  depends_on = [google_project_service.run, google_project_service.secretmanager]
}

resource "google_project_service" "run" {
  service            = "run.googleapis.com"
  disable_on_destroy = false
}

resource "google_project_service" "secretmanager" {
  service            = "secretmanager.googleapis.com"
  disable_on_destroy = false
}
