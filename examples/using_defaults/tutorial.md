# Serverless deployment of PrivateBin on Google Cloud Platform

## Setup

<walkthrough-author name="markvanholsteijn@binx.io" tutorialName="privatebin-on-gcp" repositoryUrl="https://github.com/binxio/terraform-google-privatebin"></walkthrough-author>

Select the project to deploy PrivateBin.

<walkthrough-project-billing-setup></walkthrough-project-billing-setup>

## Deploy

To deploy'PrivateBin to {{project-id}} in europe-west4.

```bash
export GOOGLE_CLOUD_PROJECT={{project-id}}
export GOOGLE_REGION=europe-west4
```

Now, type:

```bash
terraform init
```

followed by:

```bash
terraform apply
```

Terraform will show you what it plans to do. Type "yes" to accept the plan.

```bash
yes
```

## Accessing privatebin

To access privatebin, type:

```bash
open $(terraform output url)
```

You can now paste secrets and share the links with others
