# 06 - Firewall and Security

## Objective

Control network traffic to a Linux host with UFW and to an Azure VM with Network Security Groups (NSGs).

## 1. Understand the two firewall layers

- **Azure NSG:** cloud network filtering applied to a subnet or network interface.
- **UFW:** host-level firewall on Ubuntu.

For traffic to reach a service, the relevant cloud and host rules must both permit it, and the service must be listening.

## 2. UFW setup

First identify your current public source IP. Then add an SSH allow rule before enabling UFW:

```bash
sudo apt update
sudo apt install ufw

# Replace with your trusted public source IP
sudo ufw allow from YOUR_PUBLIC_IP to any port 22 proto tcp

# Web traffic
sudo ufw allow 80/tcp
sudo ufw allow 443/tcp

# Review rules before enabling
sudo ufw show added
sudo ufw status verbose

# Enable only after confirming SSH is allowed
sudo ufw enable
```

If your public IP changes, you may need to update the SSH rule. Keep an existing session open while testing a new one.

## 3. Manage UFW rules

```bash
sudo ufw status numbered
sudo ufw delete NUMBER
sudo ufw deny 8080/tcp
sudo ufw allow 8080/tcp
sudo ufw disable
```

Do not disable the firewall on an internet-facing server without understanding the exposure this creates.

## 4. Azure Network Security Groups

An NSG contains inbound and outbound security rules. Rules are evaluated by priority (lower numeric priority is evaluated first). Azure also has default rules.

Recommended lab intent:

| Direction | Protocol | Port | Source | Action |
|---|---|---:|---|---|
| Inbound | TCP | 22 | Your public IP `/32` | Allow |
| Inbound | TCP | 80 | Internet | Allow |
| Inbound | TCP | 443 | Internet | Allow when HTTPS is configured |
| Inbound | Any | Any other | Any | Deny by default |

Do not open SSH to the entire internet if a narrower source range is possible. Avoid creating broad allow rules that override intended restrictions.

## 5. Basic server hardening

- Apply security updates regularly.
- Use SSH keys and protect private keys with a passphrase.
- Restrict SSH source addresses.
- Use non-root accounts and `sudo` only when required.
- Remove unused packages and services.
- Keep only required ports open.
- Review logs and account access.
- Back up important configuration and data.
- Use HTTPS for public websites handling user traffic.

## 6. Verify exposure

```bash
sudo ufw status verbose
sudo ss -tulpen
```

From another machine:

```bash
nc -zv SERVER_PUBLIC_IP 22
nc -zv SERVER_PUBLIC_IP 80
```

A port test confirms reachability from that source at that moment; it does not replace a security review.

## Completion checklist

- [ ] Explain NSG versus UFW.
- [ ] Allow SSH from a restricted source.
- [ ] Allow HTTP and HTTPS only when needed.
- [ ] Inspect and remove unnecessary rules.
- [ ] Verify listening services and exposed ports.
