resource "scaleway_instance_security_group" "runner" {
  name = "tlforge-runner-${var.uuid}"

  inbound_default_policy  = "drop"
  outbound_default_policy = "accept"

  inbound_rule {
    action = "accept"
    port   = "22"
  }
}

resource "scaleway_instance_ip" "public_ipv4" {
  type = "routed_ipv4"
}

resource "scaleway_instance_ip" "public_ipv6" {
  type = "routed_ipv6"
}

resource "scaleway_instance_server" "runner" {
  name = "tlforge-runner-${var.uuid}"

  type  = "STARDUST1-S"
  image = "debian_trixie"

  ip_ids = [scaleway_instance_ip.public_ipv4.id, scaleway_instance_ip.public_ipv6.id]
  security_group_id = scaleway_instance_security_group.runner.id

  user_data = {
    cloud-init = templatefile("${path.module}/cloud-init.yaml", {
      uuid = var.uuid
      token = var.token
    })
  }

  root_volume {
    name       = "tlforge-runner-${var.uuid}"
    size_in_gb = 10
  }
}
