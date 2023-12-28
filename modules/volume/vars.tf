variable "image_name" {
  type        = string
  description = "Root image name"
  default     = "Ubuntu 20.04 LTS 64-bit"
}

variable "image_visibility" {
  type        = string
  description = "Image visibility"
  default     = "public"
}

variable "server_volume_type" {
  type        = string
  default     = "fast"
  description = "Disk type to be used"
}

variable "server_root_disk_gb" {
  type        = number
  default     = 40
  description = "Root disk size"
}

variable "os_zone" {
  type        = string
  description = "OS zone to be used"
}

