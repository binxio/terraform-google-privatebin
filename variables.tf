variable "region" {
  description = "to deploy the cloud run service in"
  type        = string
  default     = "europe-west1"
}

variable "image" {
  description = "of privatebin to use"
  type        = string
  default     = "gcr.io/binx-io-public/privatebin/gcs:f9ccd67"
}

data "google_client_config" "current" {
}
