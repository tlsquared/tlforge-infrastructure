resource "scaleway_instance_ip" "public_ipv4" {
  type = "routed_ipv4"
}

resource "scaleway_instance_ip" "public_ipv6" {
  type = "routed_ipv6"
}

locals {
  domains = [
    {
      dns_zone = "tlforge.dev"
      name = "@"
    },
    {
      dns_zone = "tlforge.dev"
      name = "www"
    },
    {
      dns_zone = "tlforge.com"
      name = "@"
    },
    {
      dns_zone = "tlforge.com"
      name = "www"
    },
    {
      dns_zone = "tlforge.net"
      name = "@"
    },
    {
      dns_zone = "tlforge.net"
      name = "www"
    },
  ]
}

resource "scaleway_domain_record" "ipv4" {
  for_each = {
    for domain in local.domains: "${domain.dns_zone}:${domain.name}" => domain
  }

  dns_zone = each.value.dns_zone
  name     = each.value.name
  type     = "A"
  data     = scaleway_instance_ip.public_ipv4.address
  ttl      = 3600
}

resource "scaleway_domain_record" "ipv6" {
  for_each = {
    for domain in local.domains: "${domain.dns_zone}:${domain.name}" => domain
  }

  dns_zone = each.value.dns_zone
  name     = each.value.name
  type     = "AAAA"
  data     = scaleway_instance_ip.public_ipv6.address
  ttl      = 3600
}

resource "scaleway_tem_domain" "main" {
  name       = "tlforge.dev"
  accept_tos = true
  autoconfig = true
}
