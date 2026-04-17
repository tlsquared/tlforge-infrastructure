resource "scaleway_instance_ip" "public_ipv4" {
  type = "routed_ipv4"
}

resource "scaleway_instance_ip" "public_ipv6" {
  type = "routed_ipv6"
}

resource "scaleway_block_volume" "data" {
  name       = "forge-data"
  iops       = 5000
  size_in_gb = 10
}
