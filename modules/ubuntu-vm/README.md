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
| [libvirt_pool.datastore](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/pool) | resource |
| [libvirt_volume.data_disk](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume) | resource |
| [libvirt_volume.root_disk](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume) | resource |
| [libvirt_volume.ubuntu_cloud_image](https://registry.terraform.io/providers/dmacvicar/libvirt/latest/docs/resources/volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_automation_user"></a> [automation\_user](#input\_automation\_user) | n/a | `string` | `"ubuntu"` | no |
| <a name="input_automation_user_pubkey"></a> [automation\_user\_pubkey](#input\_automation\_user\_pubkey) | n/a | `string` | n/a | yes |
| <a name="input_autostart"></a> [autostart](#input\_autostart) | Autostart the VM on hypervisor boot | `bool` | `true` | no |
| <a name="input_console_password"></a> [console\_password](#input\_console\_password) | n/a | `string` | n/a | yes |
| <a name="input_console_user"></a> [console\_user](#input\_console\_user) | n/a | `string` | `"root"` | no |
| <a name="input_cpu_count"></a> [cpu\_count](#input\_cpu\_count) | n/a | `number` | `2` | no |
| <a name="input_disk_sizes_gib"></a> [disk\_sizes\_gib](#input\_disk\_sizes\_gib) | n/a | `list(number)` | <pre>[<br/>  8<br/>]</pre> | no |
| <a name="input_gpu_pci_bus"></a> [gpu\_pci\_bus](#input\_gpu\_pci\_bus) | n/a | `string` | `""` | no |
| <a name="input_has_gpu_passthru"></a> [has\_gpu\_passthru](#input\_has\_gpu\_passthru) | n/a | `bool` | `false` | no |
| <a name="input_launch_script"></a> [launch\_script](#input\_launch\_script) | The a custom script to run on the machine after cloud-init has finished | `string` | `""` | no |
| <a name="input_memory_size_gib"></a> [memory\_size\_gib](#input\_memory\_size\_gib) | n/a | `number` | `2` | no |
| <a name="input_name"></a> [name](#input\_name) | The name of the virtual machine | `string` | n/a | yes |
<!-- END_TF_DOCS -->
