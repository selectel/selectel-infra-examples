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
| openstack_compute_flavor_v2.flavor | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_flavor_is_public"></a> [flavor\_is\_public](#input\_flavor\_is\_public) | Make flavor public | `bool` | `false` | no |
| <a name="input_flavor_local_disk_gb"></a> [flavor\_local\_disk\_gb](#input\_flavor\_local\_disk\_gb) | Local disk size in GB | `number` | `0` | no |
| <a name="input_flavor_name"></a> [flavor\_name](#input\_flavor\_name) | Flavor name | `string` | `"flavor"` | no |
| <a name="input_flavor_ram_mb"></a> [flavor\_ram\_mb](#input\_flavor\_ram\_mb) | RAM in MB in flavor | `number` | `2048` | no |
| <a name="input_flavor_vcpus"></a> [flavor\_vcpus](#input\_flavor\_vcpus) | CPUs in flavor | `number` | `2` | no |
| <a name="input_os_region"></a> [os\_region](#input\_os\_region) | Region of openstack | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_flavor_id"></a> [flavor\_id](#output\_flavor\_id) | n/a |
<!-- END_TF_DOCS -->