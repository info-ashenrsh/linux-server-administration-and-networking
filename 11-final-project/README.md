# Final Project - Secure Ubuntu Web Server on Azure

## Project objective

Deploy an internet-accessible static website on an Ubuntu Server VM in Microsoft Azure while restricting administrative access and documenting the complete implementation.

## Architecture

```text
Your computer
    |
    | SSH (TCP 22) from approved public IP
    | HTTP (TCP 80) from web clients
    v
Azure Public IP
    |
Azure Network Security Group
    |
Azure Virtual Network / Subnet
    |
Ubuntu Server VM
    |
UFW host firewall
    |
Nginx web server
    |
/var/www/linux-project/index.html
```

## Implementation phases

### Phase 1 - Plan

- Choose an Azure region.
- Choose a supported Ubuntu LTS image.
- Select a small, suitable VM size.
- Plan a non-overlapping VNet/subnet CIDR.
- Identify your current public IP for SSH restriction.
- Estimate costs and define cleanup steps.

### Phase 2 - Provision

- Create resource group.
- Create VNet and subnet.
- Create NSG and rules.
- Create public IP if needed.
- Deploy Ubuntu VM with SSH public-key authentication.

### Phase 3 - Secure access

- Connect using SSH.
- Verify OS and VM identity.
- Create a non-root admin user if needed.
- Install and test SSH public key for that user.
- Restrict inbound SSH to trusted source IP.
- Configure UFW only after confirming SSH access.

### Phase 4 - Deploy service

- Update Ubuntu packages.
- Install Nginx.
- Create `/var/www/linux-project/index.html`.
- Configure the Nginx server block.
- Run `sudo nginx -t`.
- Reload Nginx.

### Phase 5 - Validate

- Confirm Nginx is active.
- Confirm TCP 80 is listening.
- Confirm local HTTP returns `200 OK`.
- Confirm public HTTP works from an external client.
- Confirm SSH works from the approved source.
- Confirm unneeded ports are not exposed.

## Acceptance criteria

- [ ] VM is deployed and reachable.
- [ ] SSH key authentication works.
- [ ] SSH is restricted to an approved source IP where practical.
- [ ] UFW is enabled with only required ports.
- [ ] NSG allows only required inbound traffic.
- [ ] Nginx is enabled and active.
- [ ] Custom website is served over HTTP.
- [ ] Testing evidence is documented.
- [ ] Cloud resources are deleted after the lab if no longer required.

## Screenshots to add

Save sanitized screenshots in `screenshots/`:

1. Azure VM overview (hide subscription IDs and sensitive identifiers).
2. Network Security Group inbound rules.
3. Successful SSH terminal session (no secrets).
4. `ufw status verbose`.
5. `systemctl status nginx`.
6. Browser showing the deployed website.
7. `curl -I` showing the HTTP response.

Never include private keys, passwords, tokens, personal IP addresses, or account identifiers in a public repository. Consider obscuring public IP addresses in screenshots.

## Deployment record

- Azure region:
- Ubuntu image/version:
- VM size:
- Resource group:
- VNet/subnet CIDR:
- Date deployed:
- Date deleted:
- Notes:

Do not publish sensitive resource identifiers or access details in a public repository.
