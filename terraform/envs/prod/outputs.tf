resource "local_file" "ansible_inventory" {
  content  = <<EOT
[opencti]
${hcloud_server.opencti_server.ipv4_address} ansible_user=root
EOT
  filename = "../../../ansible/inventories/prod/hosts.ini"
}