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
| openstack_compute_keypair_v2.keypair_1 | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_keypair_name"></a> [keypair\_name](#input\_keypair\_name) | n/a | `string` | `"keypair_1"` | no |
| <a name="input_keypair_public_key"></a> [keypair\_public\_key](#input\_keypair\_public\_key) | n/a | `string` | n/a | yes |
| <a name="input_os_region"></a> [os\_region](#input\_os\_region) | Region of openstack | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_keypair_id"></a> [keypair\_id](#output\_keypair\_id) | ID созданной KeyPair |
| <a name="output_keypair_name"></a> [keypair\_name](#output\_keypair\_name) | Имя созданной KeyPair |
<!-- END_TF_DOCS -->