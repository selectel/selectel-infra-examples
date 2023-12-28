resource "selectel_vpc_project_v2" "project_1" {
  name = var.os_project_name
}

resource "random_password" "user_1_password" {
  length           = 32
  special          = true
  override_special = "!#$%&*()-_=+[]{}<>:?"
  min_special      = 3
  min_numeric      = 1
  min_lower        = 1
  min_upper        = 1
}

resource "selectel_vpc_user_v2" "user_1" {
  name     = var.os_username
  password = random_password.user_1_password.result
}

resource "selectel_vpc_role_v2" "role_1" {
  project_id = selectel_vpc_project_v2.project_1.id
  user_id    = selectel_vpc_user_v2.user_1.id
}
