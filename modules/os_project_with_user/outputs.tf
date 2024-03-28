output "project_id" {
  description = "ID of created project"
  value       = selectel_vpc_project_v2.project_1.id
}

output "project_name" {
  description = "Name of created project"
  value       = selectel_vpc_project_v2.project_1.name
}

output "user_id" {
  description = "ID of user that admins the project"
  value       = selectel_iam_serviceuser_v1.serviceuser_1.id
}

output "user_name" {
  description = "Username of created user"
  value       = selectel_iam_serviceuser_v1.serviceuser_1.name
}

output "user_password" {
  description = "Password of created user. Generated automatically."
  value       = random_password.serviceuser_1_password.result
  sensitive   = true
}
