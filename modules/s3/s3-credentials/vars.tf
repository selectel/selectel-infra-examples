variable "os_user_id" {
  type        = string
  description = "ID пользователя, которому надо выдать ключи S3"
}

variable "os_project_id" {
  type        = string
  description = "ID проекта, в котором находится бакет"
}

variable "credentials_name" {
  type        = string
  description = "Название создаваемых кред для S3"
}
