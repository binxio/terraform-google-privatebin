Serverless deployment of PrivateBin on GCS
==========================================
This module deploys [privatebin](https://privatebin.org) as a serverless application on [Google Cloud Platform](https://cloud.google.com).

The backend is deployed as using [Google Cloud Run](https://cloud.google.com/run) and the pastes are stored on [Google Cloud Storage](https://cloud.google.com/storage). Google Cloud Storage support is already on the master branch of PrivateBin, but it is not yet released.

This module will create the following resources:

- storage bucket named `privatebin-<google project name>`
- service account named `privatebin`
- a cloud run service named `privatebin`
- a secret named `privatebin-configuration`

deploying
=========
To deploy privatebin in your Google project, add the following module to your terraform template:

```hcl
module "privatebin" {
  source  = "git::https:/github.com/binxio/terraform-google-privatebin.git?ref=0.1.0"

  providers = {
    google      = google
    google-beta = google-beta
  }
}
```
The application will be deployed in the project and region specified by the passed in providers.
After terraform apply, the output will print the URL of your privatebin installation.

[<img src="https://storage.googleapis.com/gweb-cloudblog-publish/images/open_in_cloud_shell.max-900x900.jpg"/>](https://console.cloud.google.com/cloudshell/open?cloudshell_git_repo=https://github.com/binxio/terraform-google-privatebin.git&cloudshell_git_branch=master&cloudshell_working_dir=examples/using_defaults&cloudshell_image=gcr.io/graphite-cloud-shell-images/terraform:latest&open_in_editor=main.tf&cloudshell_tutorial=./tutorial.md)
