variable "image_name" {
  type        = string
  default     = "Ubuntu 20.04 LTS 64-bit"
  description = "Имя образа"
}

variable "most_recent" {
  type        = bool
  default     = true
  description = "Если возвращается более одного результата, используйте самое последнее изображение."
}

variable "os_region" {
  type        = string
  description = "Region of openstack"
}
