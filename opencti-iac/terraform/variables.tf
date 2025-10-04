variable "hcloud_token" {
    default = ""
    sensitive = true
}

variable "location" {
    default = "nbg1"
}

variable "server_size" {
    default = "cx42"
}

variable "os_type" {
    default = "ubuntu-24.04"
}

variable "server_name" {
    default = "prod-opencti-solo-nbg1"
}

variable "ip_name" {
    default = "opencti_ip"
}

variable "ssh_key_name" {
    default = ""
}

variable "datacenter" {
    default = "nbg1-dc3"
}