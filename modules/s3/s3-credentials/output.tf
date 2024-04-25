output "s3_credentials_access_key" {
  value = selectel_iam_s3_credentials_v1.s3_credentials_1.access_key
}

output "s3_credentials_secret_key" {
  value     = selectel_iam_s3_credentials_v1.s3_credentials_1.secret_key
  sensitive = true
}
