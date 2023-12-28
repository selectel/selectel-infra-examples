## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_http-full"></a> [http-full](#requirement\_http-full) | >= 1.3.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http-full"></a> [http-full](#provider\_http-full) | >= 1.3.1 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [http-full_http.accout-token](https://registry.terraform.io/providers/salrashid123/http-full/latest/docs/data-sources/http) | data source |
| [http-full_http.project-token](https://registry.terraform.io/providers/salrashid123/http-full/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_fetch_account_token"></a> [fetch\_account\_token](#input\_fetch\_account\_token) | Если пользователь не может получить токен аккаунта, выставить в 0 | `bool` | `true` | no |
| <a name="input_os_account"></a> [os\_account](#input\_os\_account) | Account ID | `string` | n/a | yes |
| <a name="input_os_password"></a> [os\_password](#input\_os\_password) | Пароль пользователя | `string` | n/a | yes |
| <a name="input_os_project_name"></a> [os\_project\_name](#input\_os\_project\_name) | Название проекта, к которому будет создан ключ | `string` | `""` | no |
| <a name="input_os_username"></a> [os\_username](#input\_os\_username) | Логин пользователя | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_token"></a> [account\_token](#output\_account\_token) | n/a |
| <a name="output_project_token"></a> [project\_token](#output\_project\_token) | n/a |
