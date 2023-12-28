output "project_id" {
  description = "ID of created project"
  value       = selectel_vpc_project_v2.project_1.id
}

output "project_name" {
  description = "Name of created project"
  value       = selectel_vpc_project_v2.project_1.name
}
