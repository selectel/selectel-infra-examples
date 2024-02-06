variable "network_name" {
  default = "network_1"
}

variable "subnet_cidr" {
  default = "192.168.0.0/24"
}

variable "enable_dhcp" {
  default = false
}

variable "no_gateway" {
  description = "Sets whether a network should have a gateway"
  type        = string
  default     = true
}