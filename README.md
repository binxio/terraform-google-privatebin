Serverless deployment of PrivateBin on GCS
==========================================
This module deploys [privatebin](https://privatebin.org) as a serverless application on [Google Cloud Platform](https://cloud.google.com).

The backend is deployed as using [Google Cloud Run](https://cloud.google.com/run) and the pastes are stored on [Google Cloud Storage](https://cloud.google.com/storage). Google Cloud Storage support is already on the master branch of PrivateBin, but it is not yet released. Currently the image `eu.gcr.io/binx-io-public/privatebin/gcs:f9ccd67` is used.

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
  source  = "git::https:/github.com/binxio/terraform-google-privatebin.git?ref=0.2.0"

  providers = {
    google      = google
    google-beta = google-beta
  }
}
```
The application will be deployed in the project and region specified by the passed in providers.
After terraform apply, the output will print the URL of your privatebin installation.  Alternatively you can [![open in Cloud Shell](https://gstatic.com/cloudssh/images/open-btn.png)](https://console.cloud.google.com/cloudshell/open?cloudshell_git_repo=https://github.com/binxio/terraform-google-privatebin.git&cloudshell_git_branch=main&cloudshell_working_dir=examples/using_defaults&open_in_editor=main.tf&cloudshell_tutorial=tutorial.md).

building your own image
======================
to build your own image of the privatebin application, type:

```
git clone git@github.com:PrivateBin/docker-nginx-fpm-alpine.git
cd docker-nginx-fpm-alpine
docker build --build-arg RELEASE=master --tag $YOUR_IMAGE --output type=registry,push=true .
```
Now you set the variable `image` to $YOUR_IMAGE.

