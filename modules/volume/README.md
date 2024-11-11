<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | 1.53.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.3.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 1.53.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.3.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| openstack_blockstorage_volume_v3.volume_1 | resource |
| random_string.random | resource |
| openstack_images_image_v2.image_1 | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Root image name | `string` | `"Ubuntu 20.04 LTS 64-bit"` | no |
| <a name="input_image_visibility"></a> [image\_visibility](#input\_image\_visibility) | Image visibility | `string` | `"public"` | no |
| <a name="input_os_zone"></a> [os\_zone](#input\_os\_zone) | OS zone to be used | `string` | n/a | yes |
| <a name="input_server_root_disk_gb"></a> [server\_root\_disk\_gb](#input\_server\_root\_disk\_gb) | Root disk size | `number` | `40` | no |
| <a name="input_server_volume_type"></a> [server\_volume\_type](#input\_server\_volume\_type) | Disk type to be used | `string` | `"fast"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_image_id"></a> [image\_id](#output\_image\_id) | ID of image used |
| <a name="output_volume_id"></a> [volume\_id](#output\_volume\_id) | Created volume ID |
| <a name="output_volume_name"></a> [volume\_name](#output\_volume\_name) | Name of created volume |
<!-- END_TF_DOCS -->