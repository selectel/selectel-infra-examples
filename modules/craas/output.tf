output "craas_password" {
  value       = selectel_craas_token_v1.token_1.token
  sensitive   = true
  description = "craas token"
}
