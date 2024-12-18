<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_selectel"></a> [selectel](#requirement\_selectel) | >= 5.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_selectel"></a> [selectel](#provider\_selectel) | >= 5.0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| selectel_mks_cluster_v1.cluster_1 | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Имя кластера | `string` | n/a | yes |
| <a name="input_enable_autorepair"></a> [enable\_autorepair](#input\_enable\_autorepair) | Включает или отключает автоматическое восстановление узлов (worker nodes автоматически перезапускаются). Автоматическое восстановление недоступно, если у вас есть один worker node. После автовосстановления все данные на загрузочных томах удаляются. | `bool` | `true` | no |
| <a name="input_enable_patch_version_auto_upgrade"></a> [enable\_patch\_version\_auto\_upgrade](#input\_enable\_patch\_version\_auto\_upgrade) | Включает или отключает автоматическое обновление кластера до последней доступной версии исправления Kubernetes во время периода обслуживания. | `bool` | `true` | no |
| <a name="input_kube_version"></a> [kube\_version](#input\_kube\_version) | Версия кластера kubernetes | `string` | n/a | yes |
| <a name="input_maintenance_window_start"></a> [maintenance\_window\_start](#input\_maintenance\_window\_start) | Время в формате UTC, когда начинается обслуживание кластера. Формат: hh:mm:ss. | `string` | `""` | no |
| <a name="input_os_network_id"></a> [os\_network\_id](#input\_os\_network\_id) | ID сети openstack | `string` | n/a | yes |
| <a name="input_os_project_id"></a> [os\_project\_id](#input\_os\_project\_id) | ID проекта | `string` | n/a | yes |
| <a name="input_os_region"></a> [os\_region](#input\_os\_region) | Region of openstack | `string` | n/a | yes |
| <a name="input_os_subnet_id"></a> [os\_subnet\_id](#input\_os\_subnet\_id) | ID подсети openstack | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_cluster_id"></a> [cluster\_id](#output\_cluster\_id) | ID созданного кластера |
<!-- END_TF_DOCS -->