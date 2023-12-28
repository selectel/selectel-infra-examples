data "http" "accout-token" {
  count    = var.fetch_account_token ? 1 : 0
  provider = http-full
  url      = "https://cloud.api.selcloud.ru/identity/v3/auth/tokens"
  method   = "POST"
  request_headers = {
    "Content-Type" = "application/json"
    "Accept"       = "application/json"
  }
  request_body = "{\"auth\":{\"identity\":{\"methods\":[\"password\"],\"password\":{\"user\":{\"name\":\"${var.os_username}\",\"domain\":{\"name\":\"${var.os_account}\"},\"password\":\"${var.os_password}\"}}},\"scope\":{\"domain\":{\"name\":\"${var.os_account}\"}}}}"
}

data "http" "project-token" {
  count    = var.os_project_name != "" ? 1 : 0
  provider = http-full
  url      = "https://cloud.api.selcloud.ru/identity/v3/auth/tokens"
  method   = "POST"
  request_headers = {
    "Content-Type" = "application/json"
    "Accept"       = "application/json"
  }
  request_body = "{\"auth\":{\"identity\":{\"methods\":[\"password\"],\"password\":{\"user\":{\"name\":\"${var.os_username}\",\"domain\":{\"name\":\"${var.os_account}\"},\"password\":\"${var.os_password}\"}}},\"scope\":{\"project\":{\"name\":\"${var.os_project_name}\",\"domain\":{\"name\":\"${var.os_account}\"}}}}}"
}

locals {
  account_token = var.fetch_account_token ? data.http.accout-token[0].response_headers["X-Subject-Token"] : ""
  project_token = var.os_project_name != "" ? data.http.project-token[0].response_headers["X-Subject-Token"] : ""
}
