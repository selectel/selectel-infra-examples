module "selectel_token" {
  source              = "../../selectel-token"
  os_account          = var.os_account
  os_password         = var.os_password
  os_username         = var.os_username
  fetch_account_token = false
  os_project_name     = var.os_project_name
}

data "terracurl_request" "init_s3" {
  name   = "init-s3"
  url    = "https://api.ru-1.storage.selcloud.ru/v2/hello/init"
  method = "POST"

  headers = {
    "Content-Type" = "application/json"
    "X-Auth-Token" = module.selectel_token.project_token
    "Accept"       = "application/json"
  }

  response_codes = [
    204,
    400
  ]
}

resource "openstack_objectstorage_container_v1" "bucket" {
  region        = var.os_region
  name          = var.s3_bucket_name
  content_type  = "application/json"
  force_destroy = true

  depends_on = [data.terracurl_request.init_s3]
}
