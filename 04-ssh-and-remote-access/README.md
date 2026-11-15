# 04 - SSH and Remote Access

## Objective

Use SSH to administer a remote Linux server securely with public-key authentication.

## SSH overview

SSH (Secure Shell) provides encrypted remote terminal access. The usual SSH server port is TCP 22, although administrators can configure another port.

## Generate an Ed25519 key pair

Run this on your **local computer**, not on the server:

```bash
ssh-keygen -t ed25519 -C "your-device-linux-lab"
```

Use a passphrase when prompted. The default files are commonly:
- Private key: `~/.ssh/id_ed25519`
- Public key: `~/.ssh/id_ed25519.pub`

Never share or upload the private key. The `.pub` file is the public key.

## Install the public key

If `ssh-copy-id` is available:

```bash
ssh-copy-id username@SERVER_PUBLIC_IP
```

Otherwise, append the contents of your public key file to the server user's `~/.ssh/authorized_keys`, ensuring the directory and file permissions are correct:

```bash
mkdir -p ~/.ssh
chmod 700 ~/.ssh
chmod 600 ~/.ssh/authorized_keys
```

Cloud VM creation wizards often let you supply the public key during deployment.

## Connect

```bash
ssh username@SERVER_PUBLIC_IP
```

Use verbose output for troubleshooting:

```bash
ssh -v username@SERVER_PUBLIC_IP
```

## Client configuration

Create or edit `~/.ssh/config` on your local computer:

```sshconfig
Host azure-lab
    HostName SERVER_PUBLIC_IP
    User azureuser
    IdentityFile ~/.ssh/id_ed25519
    IdentitiesOnly yes
```

Then connect using:

```bash
ssh azure-lab
```

Replace the placeholder values with your own details. Do not commit a config file containing sensitive infrastructure details if the repository is public.

## Secure server configuration

Before changing SSH server settings:
1. Keep your current SSH session open.
2. Confirm key-based login works in a second terminal.
3. Back up the configuration.
4. Validate configuration syntax.
5. Reload the SSH service.
6. Test a new connection before closing the original session.

Ubuntu's SSH server configuration is commonly under `/etc/ssh/sshd_config` and `/etc/ssh/sshd_config.d/`.

Do not disable password authentication or root login until key-based access is confirmed and you have a recovery path. Cloud provider serial console or recovery options may be needed if access is lost.

## Useful commands

```bash
# Check SSH server service
sudo systemctl status ssh

# Validate server configuration
sudo sshd -t

# Reload SSH service on Ubuntu
sudo systemctl reload ssh

# View SSH logs
sudo journalctl -u ssh -n 50
```

## Troubleshooting

- `Permission denied (publickey)`: verify username, key pair, public key installation, and file permissions.
- `Connection timed out`: check public IP, VM state, routing, NSG, host firewall, and source IP.
- `Connection refused`: host is reachable but SSH may not be listening or a firewall may reject it.
- Host key warning: verify whether the server was rebuilt or its host key legitimately changed before updating `known_hosts`. Do not blindly bypass host-key checks.

## Completion checklist

- [ ] Generate an Ed25519 key pair.
- [ ] Install the public key on a test VM.
- [ ] Connect with SSH.
- [ ] Configure an SSH host alias.
- [ ] Explain why private keys must remain private.
