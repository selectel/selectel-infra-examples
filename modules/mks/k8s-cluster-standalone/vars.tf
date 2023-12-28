variable "os_auth_url" {
  type    = string
  default = "https://api.selvpc.ru/identity/v3/auth/"
}

variable "os_project_id" {
  type        = string
  description = "ID проекта"
}

# NAT vars

variable "os_region" {
  type        = string
  description = "Region of openstack"
}

variable "nat_subnet_cidr" {
  type    = string
  default = "10.222.0.0/16"
}


# MSK cluster vars

variable "cluster_name" {
  type = string
}

variable "enable_autorepair" {
  type    = bool
  default = false
}

variable "enable_patch_version_auto_upgrade" {
  type    = bool
  default = false
}

variable "network_id" {
  type    = string
  default = ""
}

variable "kube_version" {
  type = string
}

variable "maintenance_window_start" {
  type    = string
  default = "03:00:00"
}

variable "maintenance_window_end" {
  type    = string
  default = "04:00:00"
}

# MKS NodeGroup vars

variable "os_availability_zone" {
  type = string
}

variable "nodegroups" {
  type    = string
  default = 1
}


variable "ng_nodes_count" {
  type    = list(number)
  default = [2]
}

variable "ng_cpus" {
  type    = list(number)
  default = [2]
}

variable "ng_ram_mb" {
  type    = list(number)
  default = [4096]
}

variable "ng_volume_gb" {
  type    = list(number)
  default = [32]
}

variable "ng_volume_type" {
  type    = list(string)
  default = ["fast"]
}

variable "ng_labels" {
  type    = list(map(any))
  default = [{ "role" : "system" }]
}

variable "ng_taints" {
  type = list(object({
    key    = string
    value  = string
    effect = string
  }))
  default = []
}

variable "ng_keypair_name" {
  type    = string
  default = ""
}

variable "ng_affinity_policy" {
  type    = string
  default = ""
}


# Еще раз, для групп с gpu

variable "gpu_nodegroups" {
  type    = number
  default = 0
}


variable "gpu_ng_flavor" {
  type    = list(string)
  default = ["2"]
}

variable "gpu_ng_nodes_count" {
  type    = list(number)
  default = [2]
}


variable "gpu_ng_volume_gb" {
  type    = list(number)
  default = [32]
}

variable "gpu_ng_volume_type" {
  type    = list(string)
  default = ["fast"]
}

variable "gpu_ng_labels" {
  type    = list(map(any))
  default = [{ "role" : "gpu" }]
}

variable "gpu_ng_taints" {
  type = list(object({
    key    = string
    value  = string
    effect = string
  }))
  default = []
}
