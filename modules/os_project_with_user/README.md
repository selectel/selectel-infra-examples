<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|--------|
| <a name="requirement_random"></a> [random](#requirement\_random) | ~> 3.6.0 |
| <a name="requirement_selectel"></a> [selectel](#requirement\_selectel) | ~> 6.0 |

## Providers

| Name | Version |
|------|--------|
| <a name="provider_random"></a> [random](#provider\_random) | ~> 3.6.0 |
| <a name="provider_selectel"></a> [selectel](#provider\_selectel) | ~> 6.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| random_password.serviceuser_1_password | resource |
| selectel_iam_serviceuser_v1.serviceuser_1 | resource |
| selectel_vpc_project_v2.project_1 | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_os_project_name"></a> [os\_project\_name](#input\_os\_project\_name) | Name of OpenStack project to create | `string` | n/a | yes |
| <a name="input_os_username"></a> [os\_username](#input\_os\_username) | Username of service user to create in OpenStack project | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_project_id"></a> [project\_id](#output\_project\_id) | ID of created project |
| <a name="output_project_name"></a> [project\_name](#output\_project\_name) | Name of created project |
| <a name="output_user_id"></a> [user\_id](#output\_user\_id) | ID of user that admins the project |
| <a name="output_user_name"></a> [user\_name](#output\_user\_name) | Username of created user |
| <a name="output_user_password"></a> [user\_password](#output\_user\_password) | Password of created user. Generated automatically. |
<!-- END_TF_DOCS -->