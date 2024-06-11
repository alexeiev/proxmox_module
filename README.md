# Create VM in Proxmox 

## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
|<a name="telmate/proxmox"></a>[telmate]([#telmate\/proxmox](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs))|2.9.9|

## Resources

| Name | Type |
|------|------|
|[proxmox_vm_qemu](https://registry.terraform.io/providers/Telmate/proxmox/latest/docs/resources/vm_qemu)|resource|

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
|vm_template|Template name|`string`|`ubuntu-2204-v20240213`|no|
|site|URL to Proxmox|`string`||yes|
|srv_target_node|Node in the proxmox cluster (hp01\|le01) |`string`| `hp01` | no |
|vm_qnt|number of virtual machines |`number`| `1` |no|
|vm_name|Virtual Machine Name|`string`| |yes|
|vm_id|Virtual Machine id|`number`| |yes|
|vm_memory|Memory in MB|`number`|`1024`|no|
|vm_cpu|Number of processors of the VM|`number`|`1`|no|
|vm_disk|Disk in GB|`number`|30|no|
|net|Interface name|`string`|`vmbr0`|no|
|net_vlan|Vlan tag for segmented network|`number`|`-1` (disable)|no|
|vm_ip_address|Ip address list (static)|`list(string)`| | yes|
|username-so|Username |`string`|`alexeiev`|no|
|sshkeys|SSH Public key|`string`| | no|
|environment|Create tag for environment (DEV\|QUA\|PROD)|`string`| `DEV` | no 

> [!IMPORTANT]
> The variable `vm_ip_address` is a list.
Example of use:
```bash
vm_ip_address = [ "ip=192.168.1.50/24,gw=192.168.1.1", "ip=192.168.1.51/24,gw=192.168.1.1", ... ]
```
## Outputs
| Name | Description |
|------|------|
|<a name="vm_name"></a>[vm_name](#vm_name)| Virtual Machine Name |
|<a name="ip_address"></a>[ip_address](#ip_address)|Private IP address|


Create file terrafile.tf with this content

```bash
cat <<EOF>> terrafile.tf
module "create_vm" {
  source = "github.com/alexeiev/proxmox_module?ref=v1.0.0"
  
  vm_template       = ""
  site              = ""
  srv_target_node   = ""
  vm_qnt            = 
  vm_name           = ""
  vm_id             = 
  vm_memory         =
  vm_cpu            =
  vm_disk           =
  net               = ""
  net_vlan          =
  vm_ip_address     = [ ]
  username-so       = ""
  sshkeys           = ""
  environment       = ""
}

output "vm_name" {
  value = module.create_vm.vm_name
}

output "ip_address" {
    value = module.create_vm.ip_address
}
EOF
```
> [!NOTE]
> if you use the default values, you can remove or comment the lines.

Export variables for proxmox API authentication
```bash
export PM_API_TOKEN_ID=''
export PM_API_TOKEN_SECRET=""
```

initialize the terraform for download modules and providers
```bash
terraform init
```

Create the plan for these resources
```bash
terraform plan
```

Apply this plan
```bash
terraform apply
```

To destroy resources, use:
```bash
terraform destroy
```
