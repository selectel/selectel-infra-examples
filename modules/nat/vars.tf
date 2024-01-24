variable "router_external_net_name" {
  type        = string
  default     = "external-network"
  description = "Name of external network to be used"
}

variable "dns_nameservers" {
  description = "DNS servers to be used"
  type        = list(string)
  default = [
    "188.93.16.19",
    "188.93.17.19",
  ]
}

variable "subnet_cidr" {
  description = "Subnet CIRD to be created"
  type        = string
  default     = "192.168.0.0/24"
}

variable "router_name" {
  description = "Router name to be created"
  type        = string
  default     = "router_1"
}

variable "network_name" {
  description = "Network name to be created"
  type        = string
  default     = "network_1"
}

variable "enable_dhcp" {
  description = "DHCP enable flag"
  type        = bool
  default     = false
}

variable "no_gateway" {
  default     = true
  description = "(Optional) Do not set a gateway IP on this subnet. Changing this removes or adds a default gateway IP of the existing subnet."
}
