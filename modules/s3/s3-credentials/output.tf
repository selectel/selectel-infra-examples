output "s3_credentials_access_key" {
  value = local.s3_credentials_responce.access_key
}

output "s3_credentials_secret_key" {
  value     = local.s3_credentials_responce.secret_key
  sensitive = true
}
