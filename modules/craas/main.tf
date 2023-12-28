resource "selectel_craas_registry_v1" "registry_1" {
  name       = var.craas_name
  project_id = var.os_project_id
}

resource "selectel_craas_token_v1" "token_1" {
  project_id = var.os_project_id
  token_ttl  = var.token_ttl
}
