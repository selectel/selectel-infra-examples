variable "os_username" {
  type        = string
  description = "Логин пользователя"
}

variable "os_password" {
  type        = string
  description = "Пароль пользователя"
}

variable "os_project_name" {
  type        = string
  description = "Название проекта, к которому будет создан ключ"
  default     = ""
}

variable "os_account" {
  type        = string
  description = "Account ID"
}

variable "fetch_account_token" {
  default     = true
  type        = bool
  description = "Если пользователь не может получить токен аккаунта, выставить в 0"
}