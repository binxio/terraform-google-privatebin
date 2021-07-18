# Serverless deployment of PrivateBin on Google Cloud Platform

## Setup

<walkthrough-author name="markvanholsteijn@binx.io" tutorialName="privatebin-on-gcp" repositoryUrl="https://github.com/binxio/terraform-google-privatebin"></walkthrough-author>
<walkthrough-watcher-constant key="GOOGLE_REGION" value="europe-west4"></walkthrough-watcher-constant>

Select the project to deploy PrivateBin.

<walkthrough-project-billing-setup></walkthrough-project-billing-setup>

## Deploy

To deploy PrivateBin to {{project-id}} in {{GOOGLE_REGION}}, type:

```bash
export GOOGLE_CLOUD_PROJECT={{project-id}}
export GOOGLE_REGION={{GOOGLE_REGION}}
```

Now, type:

```bash
terraform init
terraform apply -auto-approve
```

## Accessing privatebin

To access the newly deployed privatebin, click on the link.

<walkthrough-editor-open-file filePath="examples/using_defaults/terraform.tfstate" text="open terraform.tfstate"></walkthrough-editor-open-file>

You can now paste secrets and share the links with others

## Cleanup

To undeploy privatebin and destroy all resources, type: 

```bash
terraform destroy -auto-approve
```
