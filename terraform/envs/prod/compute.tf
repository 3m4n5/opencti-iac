resource "hcloud_primary_ip" "primary_ip_1" {
  name          = var.ip_name
  type          = "ipv4"
  assignee_type = "server"
  datacenter    = var.datacenter
  auto_delete   = true
}

resource "hcloud_server" "opencti_server" {
  name        = var.server_name
  image       = var.os_type
  server_type = var.server_size
  location    = var.location
  public_net {
    ipv4_enabled = true
    ipv4         = hcloud_primary_ip.primary_ip_1.id
    ipv6_enabled = false
  }
  ssh_keys = [
    data.hcloud_ssh_key.primary_key.id
  ]
}