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
