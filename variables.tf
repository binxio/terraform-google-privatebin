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

variable "privatebin_configuration" {
  description = "for this instance. class must be GoogleCloudStorage and the bucket set to ${"$"}{privatebin_bucket_name}."
  type        = string
  default     = <<EOF
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
bucket = "${"$"}{privatebin_bucket_name}"
EOF

  validation {
    condition = length(
      regexall("(?m)^bucket[[:blank:]]*=[[:blank:]]*\"\\${"$"}{privatebin_bucket_name}\"[[:blank:]]*$$",
      var.privatebin_configuration)
      ) > 0 && length(
      regexall("(?m)^class[[:blank:]]*=[[:blank:]]*GoogleCloudStorage[[:blank:]]*$$",
      var.privatebin_configuration)
    ) > 0
    error_message = "The privatebin configuration must set storage class to GoogleCloudStorage and bucket = $${privatebin_bucket_name}."
  }
}

data "google_client_config" "current" {
}
