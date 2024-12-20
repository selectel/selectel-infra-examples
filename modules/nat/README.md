<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | ~> 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | ~> 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| openstack_networking_network_v2.network_1 | resource |
| openstack_networking_router_interface_v2.router_interface_1 | resource |
| openstack_networking_router_v2.router_1 | resource |
| openstack_networking_subnet_v2.subnet_1 | resource |
| openstack_networking_network_v2.external_net | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_nameservers"></a> [dns\_nameservers](#input\_dns\_nameservers) | DNS servers to be used | `list(string)` | <pre>[<br/>  "188.93.16.19",<br/>  "188.93.17.19"<br/>]</pre> | no |
| <a name="input_enable_dhcp"></a> [enable\_dhcp](#input\_enable\_dhcp) | DHCP enable flag | `bool` | `false` | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Network name to be created | `string` | `"network_1"` | no |
| <a name="input_no_gateway"></a> [no\_gateway](#input\_no\_gateway) | (Optional) Do not set a gateway IP on this subnet. Changing this removes or adds a default gateway IP of the existing subnet. | `bool` | `true` | no |
| <a name="input_router_external_net_name"></a> [router\_external\_net\_name](#input\_router\_external\_net\_name) | Name of external network to be used | `string` | `"external-network"` | no |
| <a name="input_router_name"></a> [router\_name](#input\_router\_name) | Router name to be created | `string` | `"router_1"` | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr) | Subnet CIRD to be created | `string` | `"192.168.0.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_external_network_id"></a> [external\_network\_id](#output\_external\_network\_id) | ID внешней подсети |
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID созданной сети |
| <a name="output_router_id"></a> [router\_id](#output\_router\_id) | ID созданного роутера |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | ID созданной подсети |
<!-- END_TF_DOCS -->