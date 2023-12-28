variable "s3_bucket_name" {
  type = string
}

variable "os_account" {
  type        = string
  description = "Account ID"
}

variable "os_region" {
  type        = string
  description = "Region where network will be created"
  default     = "ru-1"
}

variable "os_username" {
  type        = string
  description = "Login to be used"
}

variable "os_password" {
  type        = string
  description = "Password of user"

}

variable "os_auth_url" {
  type        = string
  default     = "https://cloud.api.selcloud.ru/identity/v3"
  description = "Auth endpoint"
}


variable "os_project_id" {
  description = "ID of project, where bucket will be created"
  type        = string
}


variable "os_project_name" {
  description = "ID of project, where bucket will be created"
  type        = string
}
