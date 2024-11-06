resource "selectel_vpc_project_v2" "project_1" {
  name = var.os_project_name
}

resource "random_password" "serviceuser_1_password" {
  length      = 24
  special     = false
  min_numeric = 1
  min_lower   = 1
  min_upper   = 1
}

resource "selectel_iam_serviceuser_v1" "serviceuser_1" {
  name     = var.os_username
  password = random_password.serviceuser_1_password.result
  role {
    scope      = "project"
    role_name  = "member"
    project_id = selectel_vpc_project_v2.project_1.id
  }
}