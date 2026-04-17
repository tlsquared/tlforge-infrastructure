resource "scaleway_instance_ip" "public_ipv4" {
  type = "routed_ipv4"
}

resource "scaleway_instance_ip" "public_ipv6" {
  type = "routed_ipv6"
}

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

resource "scaleway_block_volume" "data" {
  name       = "forge-data"
  iops       = 5000
  size_in_gb = 10
}

resource "scaleway_instance_security_group" "main" {
  name = "forge-main"

  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = "22"
  }

  inbound_rule {
    action = "accept"
    port   = "80"
  }

  inbound_rule {
    action = "accept"
    port   = "443"
  }
}

resource "scaleway_instance_server" "main" {
  name = "forge-main"

  type  = "DEV1-S"
  image = "debian_trixie"

  ip_ids = [scaleway_instance_ip.public_ipv4.id, scaleway_instance_ip.public_ipv6.id]
  security_group_id = scaleway_instance_security_group.main.id

  root_volume {
    name       = "forge-system"
    size_in_gb = 10
  }

  additional_volume_ids = [scaleway_block_volume.data.id]

  user_data = {
    cloud-init = file("${path.module}/cloud-init.yaml")
  }
}
