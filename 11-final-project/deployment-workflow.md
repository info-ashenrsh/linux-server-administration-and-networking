# Deployment Workflow

## Pre-deployment

- [ ] Confirm subscription and budget.
- [ ] Select region and supported Ubuntu LTS image.
- [ ] Generate SSH key locally.
- [ ] Plan VNet and subnet CIDR.
- [ ] Record trusted public source IP for SSH restriction.

## Azure provisioning

- [ ] Create resource group.
- [ ] Create VNet and subnet.
- [ ] Create NSG.
- [ ] Add SSH rule from trusted source IP.
- [ ] Add HTTP rule if public web access is required.
- [ ] Create Ubuntu VM using public-key authentication.
- [ ] Confirm VM provisioning succeeds.

## Server setup

```bash
sudo apt update
sudo apt upgrade
sudo apt install -y nginx ufw curl
```

## Secure and test

- [ ] Test SSH key login in a new terminal.
- [ ] Configure UFW SSH rule from trusted source.
- [ ] Add HTTP rule.
- [ ] Enable UFW.
- [ ] Verify UFW status.
- [ ] Verify Nginx is active.

## Website deployment

Follow `../09-web-server-deployment/README.md`.

## Final validation

```bash
sudo nginx -t
sudo systemctl is-active nginx
sudo ss -tulnp
curl -I http://localhost
```

From your local computer:

```bash
curl -I http://YOUR_PUBLIC_IP
ssh username@YOUR_PUBLIC_IP
```

## Cleanup

Delete the lab resource group from Azure after collecting evidence and confirming no resources need to be retained. Verify deletion and review any resources that may exist outside the resource group.
