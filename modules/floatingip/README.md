<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
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
| openstack_networking_floatingip_v2.floatingip_1 | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_pool"></a> [pool](#input\_pool) | Имя пула, из которого можно получить плавающий IP-адрес. Изменение этого параметра создает новый плавающий IP-адрес. | `string` | `"external-network"` | no |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_floatingip_address"></a> [floatingip\_address](#output\_floatingip\_address) | floating ip |
| <a name="output_floatingip_id"></a> [floatingip\_id](#output\_floatingip\_id) | floating ip id |
<!-- END_TF_DOCS -->