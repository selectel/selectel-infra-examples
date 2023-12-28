## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | 1.53.0 |
| <a name="requirement_selectel"></a> [selectel](#requirement\_selectel) | >= 4.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_selectel"></a> [selectel](#provider\_selectel) | >= 4.0.2 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kubernetes_cluster"></a> [kubernetes\_cluster](#module\_kubernetes\_cluster) | ../k8s-cluster | n/a |
| <a name="module_kubernetes_nodegroup"></a> [kubernetes\_nodegroup](#module\_kubernetes\_nodegroup) | ../k8s-nodegroup | n/a |
| <a name="module_kubernetes_nodegroup_gpu"></a> [kubernetes\_nodegroup\_gpu](#module\_kubernetes\_nodegroup\_gpu) | ../k8s-nodegroup-gpu | n/a |
| <a name="module_nat"></a> [nat](#module\_nat) | ../../nat | n/a |

## Resources

| Name | Type |
|------|------|
| [selectel_mks_kubeconfig_v1.kubeconfig](https://registry.terraform.io/providers/selectel/selectel/latest/docs/data-sources/mks_kubeconfig_v1) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_enable_autorepair"></a> [enable\_autorepair](#input\_enable\_autorepair) | n/a | `bool` | `false` | no |
| <a name="input_enable_patch_version_auto_upgrade"></a> [enable\_patch\_version\_auto\_upgrade](#input\_enable\_patch\_version\_auto\_upgrade) | n/a | `bool` | `false` | no |
| <a name="input_gpu_ng_flavor"></a> [gpu\_ng\_flavor](#input\_gpu\_ng\_flavor) | n/a | `list(string)` | <pre>[<br>  "2"<br>]</pre> | no |
| <a name="input_gpu_ng_labels"></a> [gpu\_ng\_labels](#input\_gpu\_ng\_labels) | n/a | `list(map(any))` | <pre>[<br>  {<br>    "role": "gpu"<br>  }<br>]</pre> | no |
| <a name="input_gpu_ng_nodes_count"></a> [gpu\_ng\_nodes\_count](#input\_gpu\_ng\_nodes\_count) | n/a | `list(number)` | <pre>[<br>  2<br>]</pre> | no |
| <a name="input_gpu_ng_taints"></a> [gpu\_ng\_taints](#input\_gpu\_ng\_taints) | n/a | <pre>list(object({<br>    key    = string<br>    value  = string<br>    effect = string<br>  }))</pre> | `[]` | no |
| <a name="input_gpu_ng_volume_gb"></a> [gpu\_ng\_volume\_gb](#input\_gpu\_ng\_volume\_gb) | n/a | `list(number)` | <pre>[<br>  32<br>]</pre> | no |
| <a name="input_gpu_ng_volume_type"></a> [gpu\_ng\_volume\_type](#input\_gpu\_ng\_volume\_type) | n/a | `list(string)` | <pre>[<br>  "fast"<br>]</pre> | no |
| <a name="input_gpu_nodegroups"></a> [gpu\_nodegroups](#input\_gpu\_nodegroups) | n/a | `number` | `0` | no |
| <a name="input_kube_version"></a> [kube\_version](#input\_kube\_version) | n/a | `string` | n/a | yes |
| <a name="input_maintenance_window_end"></a> [maintenance\_window\_end](#input\_maintenance\_window\_end) | n/a | `string` | `"04:00:00"` | no |
| <a name="input_maintenance_window_start"></a> [maintenance\_window\_start](#input\_maintenance\_window\_start) | n/a | `string` | `"03:00:00"` | no |
| <a name="input_nat_subnet_cidr"></a> [nat\_subnet\_cidr](#input\_nat\_subnet\_cidr) | n/a | `string` | `"10.222.0.0/16"` | no |
| <a name="input_network_id"></a> [network\_id](#input\_network\_id) | n/a | `string` | `""` | no |
| <a name="input_ng_affinity_policy"></a> [ng\_affinity\_policy](#input\_ng\_affinity\_policy) | n/a | `string` | `""` | no |
| <a name="input_ng_cpus"></a> [ng\_cpus](#input\_ng\_cpus) | n/a | `list(number)` | <pre>[<br>  2<br>]</pre> | no |
| <a name="input_ng_keypair_name"></a> [ng\_keypair\_name](#input\_ng\_keypair\_name) | n/a | `string` | `""` | no |
| <a name="input_ng_labels"></a> [ng\_labels](#input\_ng\_labels) | n/a | `list(map(any))` | <pre>[<br>  {<br>    "role": "system"<br>  }<br>]</pre> | no |
| <a name="input_ng_nodes_count"></a> [ng\_nodes\_count](#input\_ng\_nodes\_count) | n/a | `list(number)` | <pre>[<br>  2<br>]</pre> | no |
| <a name="input_ng_ram_mb"></a> [ng\_ram\_mb](#input\_ng\_ram\_mb) | n/a | `list(number)` | <pre>[<br>  4096<br>]</pre> | no |
| <a name="input_ng_taints"></a> [ng\_taints](#input\_ng\_taints) | n/a | <pre>list(object({<br>    key    = string<br>    value  = string<br>    effect = string<br>  }))</pre> | `[]` | no |
| <a name="input_ng_volume_gb"></a> [ng\_volume\_gb](#input\_ng\_volume\_gb) | n/a | `list(number)` | <pre>[<br>  32<br>]</pre> | no |
| <a name="input_ng_volume_type"></a> [ng\_volume\_type](#input\_ng\_volume\_type) | n/a | `list(string)` | <pre>[<br>  "fast"<br>]</pre> | no |
| <a name="input_nodegroups"></a> [nodegroups](#input\_nodegroups) | n/a | `string` | `1` | no |
| <a name="input_os_auth_url"></a> [os\_auth\_url](#input\_os\_auth\_url) | n/a | `string` | `"https://api.selvpc.ru/identity/v3/auth/"` | no |
| <a name="input_os_availability_zone"></a> [os\_availability\_zone](#input\_os\_availability\_zone) | n/a | `string` | n/a | yes |
| <a name="input_os_project_id"></a> [os\_project\_id](#input\_os\_project\_id) | ID проекта | `string` | n/a | yes |
| <a name="input_os_region"></a> [os\_region](#input\_os\_region) | Region of openstack | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_kube_config"></a> [kube\_config](#output\_kube\_config) | n/a |
| <a name="output_nat_network_id"></a> [nat\_network\_id](#output\_nat\_network\_id) | n/a |
| <a name="output_nat_subnet_id"></a> [nat\_subnet\_id](#output\_nat\_subnet\_id) | n/a |
