## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0.0 |
| <a name="requirement_openstack"></a> [openstack](#requirement\_openstack) | 1.53.0 |
| <a name="requirement_selectel"></a> [selectel](#requirement\_selectel) | 5.1.1 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_openstack"></a> [openstack](#provider\_openstack) | 1.53.0 |
| <a name="provider_selectel"></a> [selectel](#provider\_selectel) | 5.1.1 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_craas"></a> [craas](#module\_craas) | ./modules/craas | n/a |
| <a name="module_fl_ip"></a> [fl\_ip](#module\_fl\_ip) | ./modules/floatingip | n/a |
| <a name="module_mks"></a> [mks](#module\_mks) | ./modules/mks/k8s-cluster-standalone | n/a |
| <a name="module_project-with-user"></a> [project-with-user](#module\_project-with-user) | ./modules/os_project_with_user | n/a |
| <a name="module_s3-bucket"></a> [s3-bucket](#module\_s3-bucket) | ./modules/s3/s3-bucket | n/a |
| <a name="module_s3-creds"></a> [s3-creds](#module\_s3-creds) | ./modules/s3/s3-credentials | n/a |
| <a name="module_sfs"></a> [sfs](#module\_sfs) | ./modules/sfs | n/a |
| <a name="module_vm"></a> [vm](#module\_vm) | ./modules/vm | n/a |

## Resources

| Name | Type |
|------|------|
| [openstack_networking_floatingip_associate_v2.association_1](https://registry.terraform.io/providers/terraform-provider-openstack/openstack/1.53.0/docs/resources/networking_floatingip_associate_v2) | resource |
| [selectel_mks_kube_versions_v1.versions](https://registry.terraform.io/providers/selectel/selectel/5.1.1/docs/data-sources/mks_kube_versions_v1) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_os_auth_url"></a> [os\_auth\_url](#input\_os\_auth\_url) | URL до openstack api | `string` | `"https://cloud.api.selcloud.ru/identity/v3"` | no |
| <a name="input_selectel_domain_name"></a> [selectel\_domain\_name](#input\_selectel\_domain\_name) | ID Selectel аккаунта | `string` | n/a | yes |
| <a name="input_selectel_user_admin_password"></a> [selectel\_user\_admin\_password](#input\_selectel\_user\_admin\_password) | Пароль от сервисного пользователя | `string` | n/a | yes |
| <a name="input_selectel_user_admin_user"></a> [selectel\_user\_admin\_user](#input\_selectel\_user\_admin\_user) | Имя сервисного пользователя, необходимо создать через панель my.selectel | `string` | n/a | yes |

## Outputs

No outputs.
