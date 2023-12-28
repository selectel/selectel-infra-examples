variable "sfs_name_prefix" {
  type        = string
  description = "Prefix of all SFS resources"
  default     = "cmlp"
}

variable "os_network_id" {
  type        = string
  description = "Network, where SFS will be deployed"
}

variable "os_subnet_id" {
  type        = string
  description = "Subnet, where SFS will be deployed"
}

variable "sfs_size" {
  type        = number
  description = "SFS size"
  default     = 50
}

variable "sfs_proto" {
  type        = string
  description = "SFS proto"
  default     = "NFS"
}

variable "sfs_volume_type" {
  type        = string
  description = "SFS volume type"
  default     = "basic"
}

variable "os_availability_zone" {
  type        = string
  description = "Zone, where SFS will be deployed"
  default     = "ru-7a"
}

variable "nat_subnet_cidr" {
  type        = string
  description = "Subnet, which will be able to access SFS"
  default     = "10.222.0.0/16"
}