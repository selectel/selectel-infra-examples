<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|--------|
| <a name="requirement_selectel"></a> [selectel](#requirement\_selectel) | ~> 6.0 |

## Providers

| Name | Version |
|------|--------|
| <a name="provider_selectel"></a> [selectel](#provider\_selectel) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| selectel_craas_registry_v1.registry_1 | resource |
| selectel_craas_token_v1.token_1 | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_craas_name"></a> [craas\_name](#input\_craas\_name) | Имя CRaaS | `string` | `"registry"` | no |
| <a name="input_os_project_id"></a> [os\_project\_id](#input\_os\_project\_id) | ID openstack проекта | `string` | n/a | yes |
| <a name="input_token_ttl"></a> [token\_ttl](#input\_token\_ttl) | Время жизни токена | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_craas_password"></a> [craas\_password](#output\_craas\_password) | craas token |
<!-- END_TF_DOCS -->