# Selectel provider vars
variable "selectel_domain_name" {
  type        = string
  description = "ID Selectel аккаунта"
}

variable "selectel_user_name" {
  type        = string
  description = "Имя сервисного пользователя"
}

variable "selectel_user_id" {
  type        = string
  description = "ID сервисного пользователя"
}

variable "selectel_user_password" {
  type        = string
  description = "Пароль сервисного пользователя"
  sensitive   = true
}

variable "selectel_project_name" {
  type        = string
  description = "Название проекта"
}

variable "selectel_project_id" {
  type        = string
  description = "ID проекта"
}

# Openstack provider vars
variable "os_auth_url" {
  type        = string
  default     = "https://cloud.api.selcloud.ru/identity/v3"
  description = "URL до openstack api"
}

# vm vars
variable "flavor_name" {
  type        = string
  default     = "1013"
  description = "Название флавора"
}