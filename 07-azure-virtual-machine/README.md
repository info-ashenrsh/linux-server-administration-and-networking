# 07 - Azure Virtual Machine Deployment

## Objective

Create the network and compute resources required for an Ubuntu Linux VM in Microsoft Azure.

## Before you begin

- Sign in to the Azure portal.
- Review current pricing and your subscription limits.
- Choose a region close to your users.
- Use a supported Ubuntu Server LTS image.
- Use SSH public-key authentication.
- Do not create a VM size larger than your lab requires.

Official starting point: https://learn.microsoft.com/en-us/azure/virtual-machines/linux/

## Suggested resource names

| Resource | Example name |
|---|---|
| Resource group | `rg-linux-server-lab` |
| Virtual network | `vnet-linux-lab` |
| Subnet | `snet-web` |
| Network security group | `nsg-linux-web` |
| Public IP | `pip-linux-web` |
| Virtual machine | `vm-linux-web` |

Names are examples; use names that match your own naming convention.

## Deployment workflow

1. Create a resource group.
2. Create a virtual network with an address space that does not overlap with networks you need to connect to.
3. Create a subnet.
4. Create or associate an NSG.
5. Create a public IP if internet access is required.
6. Create an Ubuntu VM and select SSH public-key authentication.
7. Supply your public SSH key. Never upload the private key.
8. Review networking and inbound rules before creating the VM.
9. Deploy and wait for provisioning to complete.
10. Record the VM's public and private IP addresses in a private local note, not in a public repository.

## Initial NSG rules

- SSH TCP 22 from your current public IP `/32`.
- HTTP TCP 80 from the internet for a public website.
- HTTPS TCP 443 when TLS is configured.
- Do not add broad inbound rules for all ports.

## Connect to the VM

```bash
ssh azureuser@YOUR_PUBLIC_IP
```

The username depends on the account you specified during VM creation.

## Verify the machine

```bash
whoami
hostname
hostname -I
ip addr
ip route
uname -a
uptime
```

## Cost and cleanup

Stopping a VM from inside Linux does not necessarily stop Azure compute billing. Azure resources such as managed disks and public IPs may continue to incur charges. When the lab is complete, review the resource group and delete resources you no longer need.

## Completion checklist

- [ ] Resource group created.
- [ ] Virtual network and subnet created.
- [ ] NSG configured with restricted inbound access.
- [ ] Ubuntu VM deployed.
- [ ] SSH connection successful.
- [ ] Public and private IPs identified.
- [ ] Cost and cleanup plan understood.
