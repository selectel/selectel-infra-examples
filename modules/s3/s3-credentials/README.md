<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_selectel"></a> [selectel](#requirement\_selectel) | >=5.0.2 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_selectel"></a> [selectel](#provider\_selectel) | >=5.0.2 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| selectel_iam_s3_credentials_v1.s3_credentials_1 | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_credentials_name"></a> [credentials\_name](#input\_credentials\_name) | Название создаваемых кред для S3 | `string` | n/a | yes |
| <a name="input_os_project_id"></a> [os\_project\_id](#input\_os\_project\_id) | ID проекта, в котором находится бакет | `string` | n/a | yes |
| <a name="input_os_user_id"></a> [os\_user\_id](#input\_os\_user\_id) | ID пользователя, которому надо выдать ключи S3 | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_credentials_access_key"></a> [s3\_credentials\_access\_key](#output\_s3\_credentials\_access\_key) | n/a |
| <a name="output_s3_credentials_secret_key"></a> [s3\_credentials\_secret\_key](#output\_s3\_credentials\_secret\_key) | n/a |
<!-- END_TF_DOCS -->