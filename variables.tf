variable "scaleway_bucket" {
  type      = string
  nullable  = false
}

variable "scaleway_organization_id" {
  type     = string
  nullable = false
}

variable "scaleway_project_id" {
  type     = string
  nullable = false
}

variable "scaleway_region" {
  type     = string
  default  = "fr-par"
  nullable = false
}

variable "scaleway_zone" {
  type     = string
  default  = "fr-par-1"
  nullable = false
}
