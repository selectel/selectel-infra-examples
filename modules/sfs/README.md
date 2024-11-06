<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | 3.0.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 3.0.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [openstack_sharedfilesystem_share_access_v2.share_access_1](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/3.0.0/docs/resources/sharedfilesystem_share_access_v2) | resource |
| [openstack_sharedfilesystem_share_v2.sfs_share](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/3.0.0/docs/resources/sharedfilesystem_share_v2) | resource |
| [openstack_sharedfilesystem_sharenetwork_v2.sfs_sharenetwork](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/3.0.0/docs/resources/sharedfilesystem_sharenetwork_v2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_nat_subnet_cidr"></a> [nat\_subnet\_cidr](#input\_nat\_subnet\_cidr) | Subnet, which will be able to access SFS | `string` | `"10.222.0.0/16"` | no |
| <a name="input_os_availability_zone"></a> [os\_availability\_zone](#input\_os\_availability\_zone) | Zone, where SFS will be deployed | `string` | `"ru-7a"` | no |
| <a name="input_os_network_id"></a> [os\_network\_id](#input\_os\_network\_id) | Network, where SFS will be deployed | `string` | n/a | yes |
| <a name="input_os_subnet_id"></a> [os\_subnet\_id](#input\_os\_subnet\_id) | Subnet, where SFS will be deployed | `string` | n/a | yes |
| <a name="input_sfs_name_prefix"></a> [sfs\_name\_prefix](#input\_sfs\_name\_prefix) | Prefix of all SFS resources | `string` | `"cmlp"` | no |
| <a name="input_sfs_proto"></a> [sfs\_proto](#input\_sfs\_proto) | SFS proto | `string` | `"NFS"` | no |
| <a name="input_sfs_size"></a> [sfs\_size](#input\_sfs\_size) | SFS size | `number` | `50` | no |
| <a name="input_sfs_volume_type"></a> [sfs\_volume\_type](#input\_sfs\_volume\_type) | SFS volume type | `string` | `"basic"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_sfs_address"></a> [sfs\_address](#output\_sfs\_address) | SFS path |
| <a name="output_sfs_addressess"></a> [sfs\_addressess](#output\_sfs\_addressess) | SFS paths array. For debug purposes |
<!-- END_TF_DOCS -->