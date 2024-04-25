resource "selectel_iam_s3_credentials_v1" "s3_credentials_1" {
  name       = var.credentials_name
  user_id    = var.os_user_id
  project_id = var.os_project_id
}
