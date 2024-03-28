module "selectel_token" {
  source      = "../../selectel-token"
  os_account  = var.os_account
  os_password = var.os_password
  os_username = var.os_username
}

resource "selectel_iam_s3_credentials_v1" "s3_credentials_1" {
  name       = var.credentials_name
  user_id    = var.os_user_id
  project_id = var.os_project_id
}
