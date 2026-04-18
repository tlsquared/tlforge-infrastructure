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
