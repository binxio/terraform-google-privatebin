Serverless deployment of PrivateBin on GCS
==========================================
This module deploys [privatebin](https://privatebin.org) as a serverless application on [Google Cloud Platform](https://cloud.google.com).

The backend is deployed as using [Google Cloud Run](https://cloud.google.com/run) and the pastes are stored on [Google Cloud Storage](https://cloud.google.com/storage). Google Cloud Storage support is already on the master branch of PrivateBin, but it is not yet released.

This module will create the following resources:

- storage bucket named `privatebin-<google project name>`
- service account named `privatebin`
- a cloud run service named `privatebin`
- a secret named `privatebin-configuration`


