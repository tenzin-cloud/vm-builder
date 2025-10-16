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
vm_count           = 1
vm_name            = "zfs"
vm_cpu_count       = 6
vm_memory_size_gib = 12
vm_disk_sizes_gib  = [64, 64, 64, 64]

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
ubuntu@sparkle-1:~/vm-builder$ virsh list
 Id   Name    State
-----------------------
 4    zfs-0   running

ubuntu@sparkle-1:~/vm-builder$ virsh console zfs-0
Connected to domain 'zfs-0'
Escape character is ^] (Ctrl + ])
zfs-0 login: ubuntu
Password:
...
...

root@zfs-0:~# lsblk
NAME    MAJ:MIN RM  SIZE RO TYPE MOUNTPOINTS
sr0      11:0    1  366K  0 rom  
vda     253:0    0   64G  0 disk 
├─vda1  253:1    0   63G  0 part /
├─vda14 253:14   0    4M  0 part 
├─vda15 253:15   0  106M  0 part /boot/efi
└─vda16 259:0    0  913M  0 part /boot
vdb     253:16   0   64G  0 disk 
vdc     253:32   0   64G  0 disk 
vdd     253:48   0   64G  0 disk 

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
| <a name="input_vm_disk_sizes_gib"></a> [vm\_disk\_sizes\_gib](#input\_vm\_disk\_sizes\_gib) | The disk size of the VM(s) in GiB, the first element is the root disk size, followed by data disks if any | `list(number)` | <pre>[<br/>  48<br/>]</pre> | no |
| <a name="input_vm_memory_size_gib"></a> [vm\_memory\_size\_gib](#input\_vm\_memory\_size\_gib) | The memory size of the VM(s) in GiB | `number` | `4` | no |
| <a name="input_vm_name"></a> [vm\_name](#input\_vm\_name) | The name to give to the VM(s) | `string` | `"vm"` | no |
<!-- END_TF_DOCS -->
