provider "google" {}
provider "google-beta" {}


module "privatebin" {
  source  = "git::https:/github.com/binxio/terraform-google-privatebin.git?ref=0.1.0"

  providers = {
    google      = google
    google-beta = google-beta
  }
}

