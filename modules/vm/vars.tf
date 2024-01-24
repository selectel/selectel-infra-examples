variable "vm_name" {
  type        = string
  description = "Name of VM to create"
}

variable "os_region" {
  type        = string
  description = "Region where network will be created"
}

variable "os_zone" {
  type        = string
  description = "OS zone to be used"
}

variable "server_root_disk_gb" {
  type        = list(number)
  default     = [40]
  description = "List of disks"
}

variable "server_volume_type" {
  type        = list(string)
  default     = ["fast"]
  description = "List of disk types"
}

variable "image_name" {
  type    = list(string)
  default = ["Ubuntu 20.04 LTS 64-bit"]

}

variable "vm_local_disk_gb" {
  type        = string
  description = "Flavor's local disk size"
  default     = "0"
}

variable "vm_vcpus" {
  type        = number
  description = "CPU in VMs flavor"
  default     = 2
}

variable "vm_ram_mb" {
  type        = number
  description = "RAM in VMs flavor"
  default     = 4096
}

variable "router_external_net_name" {
  type        = string
  default     = "external-network"
  description = "Name of external network to be used"
}

variable "dns_nameservers" {
  description = "DNS servers to be used, selectel dns is default"
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

variable "router1_name" {
  description = "Router name to be created"
  type        = string
  default     = "router_1"
}

variable "network1_name" {
  description = "Network name to be created"
  type        = string
  default     = "network_1"
}

variable "router2_name" {
  description = "Router name to be created"
  type        = string
  default     = "router_2"
}

variable "network2_name" {
  description = "Network name to be created"
  type        = string
  default     = "network_2"
}

variable "enable_dhcp" {
  description = "DHCP enable flag"
  type        = bool
  default     = false
}
