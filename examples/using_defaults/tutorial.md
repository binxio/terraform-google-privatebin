# Serverless deployment of PrivateBin on Google Cloud Platform

This tutorial will deploy PrivateBin in your project using Terraform. It will take just a few minutes to complete.

## Setup

<walkthrough-author 
  name="markvanholsteijn@binx.io" 
  tutorialName="privatebin-on-gcp" 
  repositoryUrl="https://github.com/binxio/terraform-google-privatebin"/>

<walkthrough-watcher-constant 
  key="GOOGLE_REGION" 
  value="europe-west4"/>

Select the project to deploy PrivateBin.

<walkthrough-project-setup billing="true"/>

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

To access the newly deployed application, type:
```bash
terraform output url
```
and click on the URL. you can now store and share confidential pastes.

## Cleanup

To undeploy privatebin and destroy all resources, type: 

```bash
terraform destroy -auto-approve
```
