# README
A Terraform module that creates virtual machines on a libvirtd host.

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.9 |
| <a name="requirement_libvirt"></a> [libvirt](#requirement\_libvirt) | ~> 0.8 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_libvirt"></a> [libvirt](#provider\_libvirt) | 0.8.3 |

## Resources

| Name | Type |
|------|------|
| [libvirt_cloudinit_disk.cloudinit_iso](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/cloudinit_disk) | resource |
| [libvirt_domain.machine](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/domain) | resource |
| [libvirt_volume.root_disk](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automation_user"></a> [automation\_user](#input\_automation\_user) | n/a | `string` | `"ubuntu"` | no |
| <a name="input_automation_user_pubkey"></a> [automation\_user\_pubkey](#input\_automation\_user\_pubkey) | n/a | `string` | n/a | yes |
| <a name="input_base_volume"></a> [base\_volume](#input\_base\_volume) | The base volume to use for the OS root disk | <pre>object({<br/>    id   = string<br/>    name = string<br/>    pool = string<br/>  })</pre> | n/a | yes |
| <a name="input_console_password"></a> [console\_password](#input\_console\_password) | n/a | `string` | n/a | yes |
| <a name="input_console_user"></a> [console\_user](#input\_console\_user) | n/a | `string` | `"root"` | no |
| <a name="input_cpu_count"></a> [cpu\_count](#input\_cpu\_count) | n/a | `number` | `2` | no |
| <a name="input_datastore_name"></a> [datastore\_name](#input\_datastore\_name) | The name of the datastore | `string` | n/a | yes |
| <a name="input_disk_size_mib"></a> [disk\_size\_mib](#input\_disk\_size\_mib) | n/a | `number` | `8192` | no |
| <a name="input_gpu_pci_bus"></a> [gpu\_pci\_bus](#input\_gpu\_pci\_bus) | n/a | `string` | `""` | no |
| <a name="input_has_gpu_passthru"></a> [has\_gpu\_passthru](#input\_has\_gpu\_passthru) | n/a | `bool` | `false` | no |
| <a name="input_launch_script"></a> [launch\_script](#input\_launch\_script) | The a custom script to run on the machine after cloud-init has finished | `string` | `""` | no |
| <a name="input_memory_size_mib"></a> [memory\_size\_mib](#input\_memory\_size\_mib) | n/a | `number` | `2048` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the virtual machine | `string` | n/a | yes |
<!-- END_TF_DOCS -->
