resource "scaleway_iam_application" "main_instance" {
  name = "forge-main-instance"
}

resource "scaleway_iam_policy" "main_instance_secret_manager_read_only" {
  name           = "forge-main-instance-secret-manager-read-only"
  application_id = scaleway_iam_application.main_instance.id

  rule {
    project_ids = [var.scaleway_project_id]
    permission_set_names = [
      "SecretManagerReadOnly",
      "SecretManagerSecretAccess"
    ]
  }
}

resource "scaleway_iam_api_key" "main_instance" {
  application_id = scaleway_iam_application.main_instance.id
}
