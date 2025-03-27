<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | 3.0.0 |
| <a name="requirement_selectel"></a> [selectel](#requirement\_selectel) | 6.4.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 3.0.0 |
| <a name="provider_selectel"></a> [selectel](#provider\_selectel) | 6.4.0 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_craas"></a> [craas](#module\_craas) | ./modules/craas | n/a |
| <a name="module_fl_ip"></a> [fl\_ip](#module\_fl\_ip) | ./modules/floatingip | n/a |
| <a name="module_mks"></a> [mks](#module\_mks) | ./modules/mks/k8s-cluster-standalone | n/a |
| <a name="module_s3-bucket"></a> [s3-bucket](#module\_s3-bucket) | ./modules/s3/s3-bucket | n/a |
| <a name="module_s3-creds"></a> [s3-creds](#module\_s3-creds) | ./modules/s3/s3-credentials | n/a |
| <a name="module_sfs"></a> [sfs](#module\_sfs) | ./modules/sfs | n/a |
| <a name="module_vm"></a> [vm](#module\_vm) | ./modules/vm | n/a |

## Resources

| Name | Type |
|------|------|
| openstack_networking_floatingip_associate_v2.association_1 | resource |
| selectel_mks_kube_versions_v1.versions | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_flavor_name"></a> [flavor\_name](#input\_flavor\_name) | Название флавора | `string` | `"1013"` | no |
| <a name="input_os_auth_url"></a> [os\_auth\_url](#input\_os\_auth\_url) | URL до openstack api | `string` | `"https://cloud.api.selcloud.ru/identity/v3"` | no |
| <a name="input_selectel_domain_name"></a> [selectel\_domain\_name](#input\_selectel\_domain\_name) | ID Selectel аккаунта | `string` | n/a | yes |
| <a name="input_selectel_project_id"></a> [selectel\_project\_id](#input\_selectel\_project\_id) | ID проекта | `string` | n/a | yes |
| <a name="input_selectel_project_name"></a> [selectel\_project\_name](#input\_selectel\_project\_name) | Название проекта | `string` | n/a | yes |
| <a name="input_selectel_user_id"></a> [selectel\_user\_id](#input\_selectel\_user\_id) | ID сервисного пользователя | `string` | n/a | yes |
| <a name="input_selectel_user_name"></a> [selectel\_user\_name](#input\_selectel\_user\_name) | Имя сервисного пользователя | `string` | n/a | yes |
| <a name="input_selectel_user_password"></a> [selectel\_user\_password](#input\_selectel\_user\_password) | Пароль сервисного пользователя | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->