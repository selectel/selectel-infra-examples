## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_selectel"></a> [selectel](#requirement\_selectel) | >= 4.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_selectel"></a> [selectel](#provider\_selectel) | >= 4.0.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [selectel_vpc_project_v2.project_1](https://registry.terraform.io/providers/selectel/selectel/latest/docs/resources/vpc_project_v2) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_os_project_name"></a> [os\_project\_name](#input\_os\_project\_name) | Name of OpenStack project to create | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | ID of created project |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | Name of created project |
