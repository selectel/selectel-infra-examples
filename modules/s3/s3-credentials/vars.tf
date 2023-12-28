variable "os_username" {
  type        = string
  description = "Логин пользователя МИНИМУМ с ролью Администратор пользователей. Именем этого пользователя будут выданы ключи от S3"
}

variable "os_password" {
  type        = string
  description = "Пароль пользователя МИНИМУМ с ролью Администратор пользователей. Именем этого пользователя будут выданы ключи от S3"
}

variable "os_user_id" {
  type        = string
  description = "ID пользователя, которому надо выдать ключи S3"
}

variable "os_project_id" {
  type        = string
  description = "ID проекта, в котором находится бакет"
}

variable "os_account" {
  type        = string
  description = "ID аккаунта"
}

variable "credentials_name" {
  type        = string
  description = "Название создаваемых кред для S3"
}
