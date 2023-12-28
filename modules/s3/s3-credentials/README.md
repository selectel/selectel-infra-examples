## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_terracurl"></a> [terracurl](#requirement\_terracurl) | >= 1.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_terracurl"></a> [terracurl](#provider\_terracurl) | >= 1.0.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_selectel_token"></a> [selectel\_token](#module\_selectel\_token) | ../../selectel-token | n/a |

## Resources

| Name | Type |
|------|------|
| [terracurl_request.s3_credentials](https://registry.terraform.io/providers/devops-rob/terracurl/latest/docs/resources/request) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_credentials_name"></a> [credentials\_name](#input\_credentials\_name) | Название создаваемых кред для S3 | `string` | n/a | yes |
| <a name="input_os_account"></a> [os\_account](#input\_os\_account) | ID аккаунта | `string` | n/a | yes |
| <a name="input_os_password"></a> [os\_password](#input\_os\_password) | Пароль пользователя МИНИМУМ с ролью Администратор пользователей. Именем этого пользователя будут выданы ключи от S3 | `string` | n/a | yes |
| <a name="input_os_project_id"></a> [os\_project\_id](#input\_os\_project\_id) | ID проекта, в котором находится бакет | `string` | n/a | yes |
| <a name="input_os_user_id"></a> [os\_user\_id](#input\_os\_user\_id) | ID пользователя, которому надо выдать ключи S3 | `string` | n/a | yes |
| <a name="input_os_username"></a> [os\_username](#input\_os\_username) | Логин пользователя МИНИМУМ с ролью Администратор пользователей. Именем этого пользователя будут выданы ключи от S3 | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_s3_credentials_access_key"></a> [s3\_credentials\_access\_key](#output\_s3\_credentials\_access\_key) | n/a |
| <a name="output_s3_credentials_secret_key"></a> [s3\_credentials\_secret\_key](#output\_s3\_credentials\_secret\_key) | n/a |
