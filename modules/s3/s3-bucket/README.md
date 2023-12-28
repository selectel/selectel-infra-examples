## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_http-full"></a> [http-full](#requirement\_http-full) | >= 1.3.1 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | 1.53.0 |
| <a name="requirement_terracurl"></a> [terracurl](#requirement\_terracurl) | >= 1.0.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 1.53.0 |
| <a name="provider_terracurl"></a> [terracurl](#provider\_terracurl) | >= 1.0.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_selectel_token"></a> [selectel\_token](#module\_selectel\_token) | ../../selectel-token | n/a |

## Resources

| Name | Type |
|------|------|
| [openstack_objectstorage_container_v1.bucket](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.53.0/docs/resources/objectstorage_container_v1) | resource |
| [terracurl_request.init_s3](https://registry.terraform.io/providers/devops-rob/terracurl/latest/docs/data-sources/request) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_os_account"></a> [os\_account](#input\_os\_account) | Account ID | `string` | n/a | yes |
| <a name="input_os_auth_url"></a> [os\_auth\_url](#input\_os\_auth\_url) | Auth endpoint | `string` | `"https://cloud.api.selcloud.ru/identity/v3"` | no |
| <a name="input_os_password"></a> [os\_password](#input\_os\_password) | Password of user | `string` | n/a | yes |
| <a name="input_os_project_id"></a> [os\_project\_id](#input\_os\_project\_id) | ID of project, where bucket will be created | `string` | n/a | yes |
| <a name="input_os_project_name"></a> [os\_project\_name](#input\_os\_project\_name) | ID of project, where bucket will be created | `string` | n/a | yes |
| <a name="input_os_region"></a> [os\_region](#input\_os\_region) | Region where network will be created | `string` | `"ru-1"` | no |
| <a name="input_os_username"></a> [os\_username](#input\_os\_username) | Login to be used | `string` | n/a | yes |
| <a name="input_s3_bucket_name"></a> [s3\_bucket\_name](#input\_s3\_bucket\_name) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
