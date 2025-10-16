variable "hcloud_token" {
  default   = ""
  sensitive = true
}

variable "location" {
  default = "hel1"
}

variable "server_size" {
  default = "cpx41"
}

variable "os_type" {
  default = "ubuntu-24.04"
}

variable "server_name" {
  default = "prod-opencti-solo-hel1"
}

variable "ip_name" {
  default = "opencti_ip"
}

variable "ssh_key_name" {
  default = ""
}

variable "datacenter" {
  default = "hel1-dc2"
}
