# 08 - Initial Linux Server Configuration

## Objective

Apply a safe baseline configuration after creating an Ubuntu VM.

## 1. Confirm identity and OS

```bash
whoami
hostnamectl
cat /etc/os-release
uname -r
```

## 2. Update packages

```bash
sudo apt update
sudo apt upgrade
```

Review package changes before confirming if you are operating a server with important workloads. Reboot if the system indicates a reboot is required:

```bash
[ -f /var/run/reboot-required ] && echo "Reboot required"
```

## 3. Install basic tools

```bash
sudo apt install -y curl wget git vim htop dnsutils netcat-openbsd ufw
```

## 4. Create an administrative user

```bash
sudo adduser devops
sudo usermod -aG sudo devops
```

Install and test SSH access for this account before relying on it. Keep the original cloud-provisioned account until the new access path is confirmed.

## 5. Configure hostname (optional)

```bash
sudo hostnamectl set-hostname linux-web-server
hostnamectl
```

Changing the hostname may affect monitoring or scripts that expect the old name.

## 6. Configure firewall carefully

Follow [`../06-firewall-and-security/README.md`](../06-firewall-and-security/README.md). Confirm the Azure NSG and UFW both allow your approved SSH source before enabling host firewall restrictions.

## 7. Verify baseline

```bash
uptime
free -h
df -h
ip addr
ip route
sudo ss -tulpen
systemctl --failed
```

## Completion checklist

- [ ] OS and hostname verified.
- [ ] Packages updated.
- [ ] Basic administration tools installed.
- [ ] Additional user created and SSH access tested.
- [ ] Firewall configured without losing remote access.
- [ ] System health checks recorded.
