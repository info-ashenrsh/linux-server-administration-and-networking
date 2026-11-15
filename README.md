# Linux Server Administration & Networking

A practical, step-by-step learning repository for Linux command-line administration, users and permissions, processes and services, SSH, IP networking, DNS, ports, firewalls, and deployment of a secure Ubuntu web server on Microsoft Azure.

> **Lab target:** Ubuntu Server 24.04 LTS (or another currently supported Ubuntu LTS release).  
> **Cloud target:** Microsoft Azure. The same Linux exercises can also be completed in a local VM.

## Learning outcomes

By completing this repository, you will be able to:

- Navigate and manage a Linux filesystem from the CLI.
- Create users and groups and apply least-privilege permissions.
- Inspect processes, manage `systemd` services, and read logs.
- Generate SSH keys and securely connect to a remote server.
- Explain IPv4, CIDR, subnets, gateways, DNS, TCP/UDP, and ports.
- Configure a host firewall with UFW and cloud filtering with Azure NSGs.
- Deploy an Ubuntu VM, configure it, host a website with Nginx, and test connectivity.
- Document and troubleshoot a complete cloud deployment.

## Prerequisites

- A computer with a terminal (Windows PowerShell, Windows Terminal, macOS Terminal, or Linux terminal).
- Basic computer and internet knowledge.
- A GitHub account.
- An Azure account if completing the cloud deployment. Check pricing before creating resources.
- An SSH client. Windows 10/11, macOS, and most Linux distributions include one.

## Repository map

| Folder | Contents |
|---|---|
| `01-linux-fundamentals/` | CLI, filesystem, files, directories, permissions |
| `02-users-and-groups/` | Accounts, groups, sudo, passwords |
| `03-process-and-service-management/` | Processes, systemd, logs |
| `04-ssh-and-remote-access/` | SSH keys, client config, secure access |
| `05-networking-fundamentals/` | IP addressing, subnetting, DNS, ports, routes |
| `06-firewall-and-security/` | UFW, Azure NSGs, hardening |
| `07-azure-virtual-machine/` | Azure resources and Ubuntu VM deployment |
| `08-server-configuration/` | First boot and server baseline |
| `09-web-server-deployment/` | Nginx and a sample website |
| `10-testing-and-troubleshooting/` | Validation and troubleshooting |
| `11-final-project/` | End-to-end implementation and evidence |
| `scripts/` | Reusable Bash helper scripts |
| `resources/` | Cheatsheets, glossary, links |

## Recommended learning order

1. Read the module `README.md` files in order.
2. Run commands in a disposable Ubuntu VM before using a production server.
3. Record the command, purpose, result, and any issue in your notes.
4. Complete each practical exercise.
5. Complete the final Azure deployment only after understanding SSH and firewall rules.

## Safety rules

- Never publish private SSH keys, passwords, access tokens, connection strings, or cloud credentials.
- Do not paste secrets into GitHub issues, commits, screenshots, or Markdown files.
- Restrict SSH (TCP 22) to your own public IP whenever possible.
- Add and test an SSH allow rule before enabling UFW.
- Keep an existing SSH session open while testing a new SSH configuration.
- Do not disable password authentication until key-based login has been tested in a second session.
- Use least privilege; do not run routine tasks as `root`.
- Azure resources can incur charges even when a VM is stopped, depending on disks, public IPs, and other resources. Delete the lab resource group when finished if you no longer need it.

## Quick start

```bash
# Clone your repository
git clone https://github.com/YOUR_USERNAME/linux-server-administration-and-networking.git
cd linux-server-administration-and-networking

# Inspect the project
ls -la
```

Start with [`01-linux-fundamentals/README.md`](01-linux-fundamentals/README.md).

## Final project

Deploy a secure Ubuntu VM on Azure, configure SSH, apply NSG and UFW rules, install Nginx, publish a static HTML page, and verify:

- SSH access works from an approved source.
- TCP port 80 is reachable.
- Nginx is active.
- The website returns HTTP `200 OK`.
- Unnecessary inbound ports are not exposed.

See [`11-final-project/README.md`](11-final-project/README.md).

## Progress tracker

- [ ] Complete Linux fundamentals.
- [ ] Complete users and groups.
- [ ] Complete process and service management.
- [ ] Configure SSH key authentication.
- [ ] Complete networking fundamentals.
- [ ] Configure UFW and understand Azure NSGs.
- [ ] Deploy an Azure Ubuntu VM.
- [ ] Configure and secure the server.
- [ ] Deploy the Nginx website.
- [ ] Complete final testing and documentation.

## Author

Add your name, course, university, or portfolio link here.
