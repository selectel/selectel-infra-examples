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
| openstack_images_image_v2.image_1 | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_image_name"></a> [image\_name](#input\_image\_name) | Имя образа | `string` | `"Ubuntu 20.04 LTS 64-bit"` | no |
| <a name="input_most_recent"></a> [most\_recent](#input\_most\_recent) | Если возвращается более одного результата, используйте самое последнее изображение. | `bool` | `true` | no |
| <a name="input_os_region"></a> [os\_region](#input\_os\_region) | Region of openstack | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_image_id"></a> [image\_id](#output\_image\_id) | ID созданного image |
<!-- END_TF_DOCS -->