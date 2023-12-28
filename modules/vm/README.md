## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | 1.53.0 |
| <a name="requirement_selectel"></a> [selectel](#requirement\_selectel) | >= 4.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 1.53.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nat"></a> [nat](#module\_nat) | ../nat | n/a |
| <a name="module_os-flavor"></a> [os-flavor](#module\_os-flavor) | ../flavor | n/a |
| <a name="module_volume"></a> [volume](#module\_volume) | ../volume | n/a |

## Resources

| Name | Type |
|------|------|
| [openstack_compute_instance_v2.instance_1](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.53.0/docs/resources/compute_instance_v2) | resource |
| [openstack_networking_port_v2.port_1](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.53.0/docs/resources/networking_port_v2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_nameservers"></a> [dns\_nameservers](#input\_dns\_nameservers) | DNS servers to be used, selectel dns is default | `list(string)` | <pre>[<br>  "188.93.16.19",<br>  "188.93.17.19"<br>]</pre> | no |
| <a name="input_enable_dhcp"></a> [enable\_dhcp](#input\_enable\_dhcp) | DHCP enable flag | `bool` | `false` | no |
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | n/a | `list(string)` | <pre>[<br>  "Ubuntu 20.04 LTS 64-bit"<br>]</pre> | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Network name to be created | `string` | `"network_1"` | no |
| <a name="input_os_region"></a> [os\_region](#input\_os\_region) | Region where network will be created | `string` | n/a | yes |
| <a name="input_os_zone"></a> [os\_zone](#input\_os\_zone) | OS zone to be used | `string` | n/a | yes |
| <a name="input_router_external_net_name"></a> [router\_external\_net\_name](#input\_router\_external\_net\_name) | Name of external network to be used | `string` | `"external-network"` | no |
| <a name="input_router_name"></a> [router\_name](#input\_router\_name) | Router name to be created | `string` | `"router_1"` | no |
| <a name="input_server_root_disk_gb"></a> [server\_root\_disk\_gb](#input\_server\_root\_disk\_gb) | List of disks | `list(number)` | <pre>[<br>  40<br>]</pre> | no |
| <a name="input_server_volume_type"></a> [server\_volume\_type](#input\_server\_volume\_type) | List of disk types | `list(string)` | <pre>[<br>  "fast"<br>]</pre> | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | Subnet CIRD to be created | `string` | `"192.168.0.0/24"` | no |
| <a name="input_vm_local_disk_gb"></a> [vm\_local\_disk\_gb](#input\_vm\_local\_disk\_gb) | Flavor's local disk size | `string` | `"0"` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | Name of VM to create | `string` | n/a | yes |
| <a name="input_vm_ram_mb"></a> [vm\_ram\_mb](#input\_vm\_ram\_mb) | RAM in VMs flavor | `number` | `4096` | no |
| <a name="input_vm_vcpus"></a> [vm\_vcpus](#input\_vm\_vcpus) | CPU in VMs flavor | `number` | `2` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nat_net_id"></a> [nat\_net\_id](#output\_nat\_net\_id) | n/a |
| <a name="output_nat_sub_id"></a> [nat\_sub\_id](#output\_nat\_sub\_id) | n/a |
| <a name="output_vm_port_id"></a> [vm\_port\_id](#output\_vm\_port\_id) | n/a |
