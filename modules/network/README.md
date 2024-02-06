## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | 1.53.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 1.53.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [openstack_networking_network_v2.network_1](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.53.0/docs/resources/networking_network_v2) | resource |
| [openstack_networking_subnet_v2.subnet_1](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.53.0/docs/resources/networking_subnet_v2) | resource |

## Inputs

| Name                                                                     | Description | Type | Default            | Required |
|--------------------------------------------------------------------------|-------------|------|--------------------|:--------:|
| <a name="input_enable_dhcp"></a> [enable\_dhcp](#input\_enable\_dhcp)    | DHCP enable flag | `bool` | `false`            | no |
| <a name="input_no_gateway"></a> [no\_gateway](#input\_no\_gateway)       | Sets whether a network should have a gateway | `string` | `"true"`           | no |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | Network name to be created | `string` | `"network_1"`      | no |
| <a name="input_subnet_cidr"></a> [subnet\_cidr](#input\_subnet\_cidr)    | Subnet CIRD to be created | `string` | `"192.168.0.0/24"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_network_id"></a> [network\_id](#output\_network\_id) | ID созданной сети |
| <a name="output_subnet_id"></a> [subnet\_id](#output\_subnet\_id) | ID созданной подсети |
