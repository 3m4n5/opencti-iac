terraform {
    required_providers {
      hcloud = {
        source = "hetznercloud/hcloud"
        version = "> 1.45"
      }
    }
}

provider "hcloud" {
    token = "${var.hcloud_token}"
}

resource "hcloud_primary_ip" "primary_ip_1" {
    name = var.ip_name
    type = "ipv4"
    assignee_type = "server"    
    datacenter = var.datacenter
    auto_delete = true
}

resource "hcloud_server" "opencti_server" {
    name = var.server_name
    image = var.os_type
    server_type = var.server_size
    location = var.location
    public_net {
        ipv4_enabled = true
        ipv4 = hcloud_primary_ip.primary_ip_1.id
        ipv6_enabled = false
    }
    ssh_keys = [
        data.hcloud_ssh_key.primary_key.id
    ]
}

resource "local_file" "ansible_inventory" {
    content = <<EOT
[opencti]
${hcloud_server.opencti_server.ipv4_address} ansible_user=root
EOT
    filename = "../ansible/inventory.ini"
}