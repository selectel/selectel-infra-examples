variable "cluster_name" {
  type        = string
  description = "Имя кластера"
}

variable "os_project_id" {
  type        = string
  description = "ID проекта"
}

variable "os_region" {
  type        = string
  description = "Region of openstack"
}

variable "kube_version" {
  type        = string
  description = "Версия кластера kubernetes"
}

variable "enable_autorepair" {
  type        = bool
  description = "Включает или отключает автоматическое восстановление узлов (worker nodes автоматически перезапускаются). Автоматическое восстановление недоступно, если у вас есть один worker node. После автовосстановления все данные на загрузочных томах удаляются."
  default     = true
}

variable "enable_patch_version_auto_upgrade" {
  type        = bool
  description = "Включает или отключает автоматическое обновление кластера до последней доступной версии исправления Kubernetes во время периода обслуживания."
  default     = true
}

variable "os_network_id" {
  type        = string
  description = "ID сети openstack"
}

variable "os_subnet_id" {
  type        = string
  description = "ID подсети openstack"
}

variable "maintenance_window_start" {
  type        = string
  description = "Время в формате UTC, когда начинается обслуживание кластера. Формат: hh:mm:ss."
  default     = ""
}
