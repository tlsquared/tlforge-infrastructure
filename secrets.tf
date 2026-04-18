resource "scaleway_secret" "internal_token" {
  name = "forgejo-internal-token"
}

resource "scaleway_secret" "jwt_secret" {
  name = "forgejo-jwt-secret"
}

resource "scaleway_secret" "lfs_jwt_secret" {
  name = "forgejo-lfs-jwt-secret"
}

resource "scaleway_secret" "secret_key" {
  name = "forgejo-secret-key"
}

resource "scaleway_secret" "signing_key" {
  name = "signing-key"
}

resource "scaleway_secret" "smtp_host" {
  name = "smtp-host"
}

resource "scaleway_secret_version" "smtp_host" {
  secret_id = scaleway_secret.smtp_host.id
  data_wo   = scaleway_tem_domain.main.smtp_host
}

resource "scaleway_secret" "smtp_port" {
  name = "smtp-port"
}

resource "scaleway_secret_version" "smtp_port" {
  secret_id = scaleway_secret.smtp_port.id
  data_wo   = scaleway_tem_domain.main.smtp_port
}

resource "scaleway_secret" "smtp_user" {
  name = "smtp-user"
}

resource "scaleway_secret_version" "smtp_user" {
  secret_id = scaleway_secret.smtp_user.id
  data_wo   = scaleway_tem_domain.main.smtps_auth_user
}

resource "scaleway_secret" "smtp_password" {
  name = "smtp-password"
}

resource "scaleway_secret_version" "smtp_password" {
  secret_id = scaleway_secret.smtp_password.id
  data_wo   = scaleway_iam_api_key.main_instance.secret_key
}
