variable "cluster_id" {
  type        = string
  description = "ID кластера"
}

variable "os_project_id" {
  type        = string
  description = "ID проекта"
}

variable "os_region" {
  description = "Регион my.selectel"
}


variable "availability_zone" {}

variable "nodes_count" {
  default = 1
}

variable "keypair_name" {
  default = ""
}

variable "affinity_policy" {
  default = ""
}

variable "cpus" {
  default = 1
}

variable "ram_mb" {
  default = 1024
}

variable "volume_gb" {
  default = 10
}

variable "volume_type" {}

variable "labels" {}

variable "taints" {}

variable "flavor_id" {}

