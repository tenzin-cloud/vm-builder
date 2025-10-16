# README
A repository to help build virtual machines on my servers.

## Pre-requiste packages for Terraform execution host
```
sudo apt-get update 
sudo apt-get install -y mkisofs xsltproc 
```

### Ease of use
Create a `terraform.tfvars` and populate the needed variables.  See example below.

```hcl
## for direct console access for the new VMs
vm_console_user     = "ubuntu"
vm_console_password = "ubuntu"

## for remote SSH access for the new VMs
vm_automation_user        = "ubuntu"
vm_automation_user_pubkey = "ssh-rsa ..long pub key string here.."
```

### Helper commands
- Use `virsh list` to see all the running VMs, use `--all` to see any shutdown VMs.
- Use `virsh console <vm name>` to connect to the VM's console, use control+] to break out of the console.

```
ubuntu@nvidia-1:~/workspaces/vm-builder$ virsh list
 Id   Name   State
----------------------
 1    vm-0   running
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_libvirt"></a> [libvirt](#requirement\_libvirt) | 0.8.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_virtual_machines"></a> [virtual\_machines](#module\_virtual\_machines) | ./modules/ubuntu-vm | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_vm_automation_user"></a> [vm\_automation\_user](#input\_vm\_automation\_user) | The username of the remote SSH user | `string` | n/a | yes |
| <a name="input_vm_automation_user_pubkey"></a> [vm\_automation\_user\_pubkey](#input\_vm\_automation\_user\_pubkey) | The SSH public key of the remote SSH user | `string` | n/a | yes |
| <a name="input_vm_console_password"></a> [vm\_console\_password](#input\_vm\_console\_password) | The password of the console user | `string` | n/a | yes |
| <a name="input_vm_console_user"></a> [vm\_console\_user](#input\_vm\_console\_user) | The username of the console user | `string` | n/a | yes |
| <a name="input_vm_count"></a> [vm\_count](#input\_vm\_count) | The number of VM(s) to create | `number` | `1` | no |
| <a name="input_vm_cpu_count"></a> [vm\_cpu\_count](#input\_vm\_cpu\_count) | The CPU count of the VM(s) | `number` | `2` | no |
| <a name="input_vm_memory_size_gib"></a> [vm\_memory\_size\_gib](#input\_vm\_memory\_size\_gib) | The memory size of the VM(s) in GiB | `number` | `4` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | The name to give to the VM(s) | `string` | `"vm"` | no |
| <a name="input_vm_root_disk_size_gib"></a> [vm\_root\_disk\_size\_gib](#input\_vm\_root\_disk\_size\_gib) | The root disk size of the VM(s) in GiB | `number` | `48` | no |
<!-- END_TF_DOCS -->