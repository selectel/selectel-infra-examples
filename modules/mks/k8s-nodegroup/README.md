<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_selectel"></a> [selectel](#requirement\_selectel) | ~> 6.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_selectel"></a> [selectel](#provider\_selectel) | ~> 6.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| selectel_mks_nodegroup_v1.nodegroup_1 | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_affinity_policy"></a> [affinity\_policy](#input\_affinity\_policy) | n/a | `string` | `""` | no |
| <a name="input_availability_zone"></a> [availability\_zone](#input\_availability\_zone) | n/a | `any` | n/a | yes |
| <a name="input_cluster_id"></a> [cluster\_id](#input\_cluster\_id) | ID кластера | `string` | n/a | yes |
| <a name="input_cpus"></a> [cpus](#input\_cpus) | n/a | `string` | `""` | no |
| <a name="input_flavor_id"></a> [flavor\_id](#input\_flavor\_id) | n/a | `string` | `""` | no |
| <a name="input_keypair_name"></a> [keypair\_name](#input\_keypair\_name) | n/a | `string` | `""` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | n/a | `any` | n/a | yes |
| <a name="input_nodes_count"></a> [nodes\_count](#input\_nodes\_count) | n/a | `number` | `1` | no |
| <a name="input_os_project_id"></a> [os\_project\_id](#input\_os\_project\_id) | ID проекта | `string` | n/a | yes |
| <a name="input_os_region"></a> [os\_region](#input\_os\_region) | Region of openstack | `string` | n/a | yes |
| <a name="input_ram_mb"></a> [ram\_mb](#input\_ram\_mb) | n/a | `string` | `""` | no |
| <a name="input_taints"></a> [taints](#input\_taints) | n/a | `any` | n/a | yes |
| <a name="input_volume_gb"></a> [volume\_gb](#input\_volume\_gb) | n/a | `number` | `10` | no |
| <a name="input_volume_type"></a> [volume\_type](#input\_volume\_type) | n/a | `any` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nodegroup_id"></a> [nodegroup\_id](#output\_nodegroup\_id) | n/a |
<!-- END_TF_DOCS -->