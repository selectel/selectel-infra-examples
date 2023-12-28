variable "craas_name" {
  description = "Имя CRaaS"
  type        = string
  default     = "registry"
}

variable "os_project_id" {
  description = "ID openstack проекта"
  type        = string
}

variable "token_ttl" {
  description = "Время жизни токена"
  type        = string
}