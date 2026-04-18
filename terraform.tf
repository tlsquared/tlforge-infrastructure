terraform {
  required_providers {
    scaleway = {
      source = "scaleway/scaleway"
    }
  }

  backend "s3" {
    bucket = "tlsquared-tlforge-tfstate"
    key    = "tlforge.tfstate"
    region = "fr-par"

    endpoints = { s3 = "https://s3.fr-par.scw.cloud" }

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
