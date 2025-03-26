provider "selectel" {
  domain_name = var.selectel_domain_name
  username    = var.selectel_user_name
  password    = var.selectel_user_password
  auth_url    = var.os_auth_url
  auth_region = "ru-9"
}

provider "openstack" {
  auth_url            = var.os_auth_url
  user_name           = var.selectel_user_name
  tenant_id           = var.selectel_project_id
  password            = var.selectel_user_password
  project_domain_name = var.selectel_domain_name
  user_domain_name    = var.selectel_domain_name
  region              = "ru-9"
}
