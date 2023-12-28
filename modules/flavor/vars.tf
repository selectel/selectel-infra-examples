variable "flavor_name" {
  description = "Flavor name"
  type        = string
  default     = "flavor"
}

variable "flavor_vcpus" {
  description = "CPUs in flavor"
  type        = number
  default     = 2
}

variable "flavor_ram_mb" {
  description = "RAM in MB in flavor"
  type        = number
  default     = 2048
}

variable "flavor_local_disk_gb" {
  description = "Local disk size in GB"
  type        = number
  default     = 0
}

variable "flavor_is_public" {
  type        = bool
  description = "Make flavor public"
  default     = false
}

variable "os_region" {
  description = "Region of openstack"
  type        = string
}
