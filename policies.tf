resource "scaleway_iam_application" "main_instance" {
  name = "tlforge-main-instance"
}

resource "scaleway_iam_policy" "main_instance_secrets" {
  name           = "tlforge-main-instance-secrets"
  application_id = scaleway_iam_application.main_instance.id

  rule {
    project_ids = [var.scaleway_project_id]
    permission_set_names = [
      "SecretManagerReadOnly",
      "SecretManagerSecretAccess"
    ]
  }
}

resource "scaleway_iam_policy" "main_instance_emails" {
  name           = "tlforge-main-instance-email"
  application_id = scaleway_iam_application.main_instance.id

  rule {
    project_ids = [var.scaleway_project_id]
    permission_set_names = [
      "TransactionalEmailEmailSmtpCreate"
    ]
  }
}

resource "scaleway_iam_api_key" "main_instance" {
  application_id = scaleway_iam_application.main_instance.id
}
