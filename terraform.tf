terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }

  backend "s3" {
    bucket = var.scaleway_bucket
    key    = "forge-infrastructure.tfstate"
    region = var.scaleway_region

    endpoints = { s3 = "https://s3.${var.scaleway_region}.scw.cloud" }

    skip_credentials_validation = true
    skip_region_validation      = true
    skip_requesting_account_id  = true
  }

  required_version = ">= 1.11"
}

provider "scaleway" {
  organization_id = var.scaleway_organization_id
  project_id      = var.scaleway_project_id
  region          = var.scaleway_region
  zone            = var.scaleway_zone
}
