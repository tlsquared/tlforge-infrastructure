variable "scaleway_project_id" {
  type      = string
  nullable  = false
  sensitive = true
}

variable "runners" {
  type = list(object({
    uuid = string
    token = string
  }))

  default   = []
  nullable  = false
}
