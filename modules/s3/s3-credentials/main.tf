module "selectel_token" {
  source      = "../../selectel-token"
  os_account  = var.os_account
  os_password = var.os_password
  os_username = var.os_username
}

resource "terracurl_request" "s3_credentials" {
  name         = "vault-mount"
  url          = "https://api.selectel.ru/iam/v1/service_users/${var.os_user_id}/credentials"
  method       = "POST"
  request_body = <<EOF
    {
      "name": "${var.credentials_name}",
      "project_id": "${var.os_project_id}" }"
    }
    EOF

  headers = {
    "Content-Type" = "application/json"
    "X-Auth-Token" = module.selectel_token.account_token
    "Accept"       = "application/json"
  }

  response_codes = [
    201
  ]

  lifecycle {
    ignore_changes = [headers]
  }
}

locals {
  s3_credentials_responce = jsondecode(terracurl_request.s3_credentials.response)
}
