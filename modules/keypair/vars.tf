variable "keypair_name" {
  default = "keypair_1"
  type    = string
}

variable "keypair_public_key" {
  type = string
}

variable "os_region" {
  type        = string
  description = "Region of openstack"
}
