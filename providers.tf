provider "selectel" {
  domain_name = var.selectel_domain_name
  username    = var.selectel_user_admin_user
  password    = var.selectel_user_admin_password
  auth_url    = var.os_auth_url
  auth_region = "ru-9"
}

provider "openstack" {
  auth_url            = var.os_auth_url
  user_name           = module.project-with-user.user_name
  tenant_id           = module.project-with-user.project_id
  password            = module.project-with-user.user_password
  project_domain_name = var.selectel_domain_name
  user_domain_name    = var.selectel_domain_name
  region              = "ru-9"
}
