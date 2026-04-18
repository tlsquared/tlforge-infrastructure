resource "scaleway_block_volume" "data" {
  name       = "tlforge-main-data"
  iops       = 5000
  size_in_gb = 10
}

resource "scaleway_instance_security_group" "main" {
  name = "tlforge-main"

  enable_default_security = false
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
  name = "tlforge-main"

  type  = "DEV1-S"
  image = "debian_trixie"

  ip_ids = [scaleway_instance_ip.public_ipv4.id, scaleway_instance_ip.public_ipv6.id]
  security_group_id = scaleway_instance_security_group.main.id

  root_volume {
    name       = "tlforge-main-system"
    size_in_gb = 10
  }

  additional_volume_ids = [scaleway_block_volume.data.id]

  user_data = {
    cloud-init = file("${path.module}/cloud-init.yaml")
    scw-access-key = scaleway_iam_api_key.main_instance.access_key
    scw-secret-key = scaleway_iam_api_key.main_instance.secret_key
  }
}
