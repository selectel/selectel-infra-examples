variable "pool" {
  type        = string
  description = "Имя пула, из которого можно получить плавающий IP-адрес. Изменение этого параметра создает новый плавающий IP-адрес."
  default     = "external-network"
}

variable "region" {
  type = string
}
