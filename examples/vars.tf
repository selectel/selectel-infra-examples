# Selectel provider vars
variable "selectel_domain_name" {
  type        = string
  description = "ID Selectel аккаунта"
}

variable "selectel_user_admin_user" {
  type        = string
  description = "Имя сервисного пользователя, необходимо создать через панель my.selectel"
}

variable "selectel_user_admin_password" {
  type        = string
  description = "Пароль от сервисного пользователя"
}

# Openstack provider vars
variable "os_auth_url" {
  type        = string
  default     = "https://cloud.api.selcloud.ru/identity/v3"
  description = "URL до openstack api"
}
