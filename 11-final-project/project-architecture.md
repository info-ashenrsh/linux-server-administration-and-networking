# Project Architecture

## Components

| Component | Role |
|---|---|
| Local computer | Administrator workstation |
| SSH client | Encrypted remote administration |
| Azure Public IP | Public endpoint for the VM |
| NSG | Cloud-level traffic filtering |
| Virtual Network | Private Azure network |
| Subnet | VM network segment |
| Ubuntu VM | Linux host |
| UFW | Host-level firewall |
| Nginx | HTTP web server |
| HTML page | Website content |

## Traffic flows

### Administration

Administrator workstation -> Azure Public IP -> NSG allows TCP 22 from approved source -> Ubuntu SSH service.

### Website

Web browser -> Azure Public IP -> NSG allows TCP 80 -> UFW allows TCP 80 -> Nginx -> HTML content.

## Security boundaries

The NSG and UFW are separate controls. Both must permit intended traffic. A service should listen only where necessary, and only required ports should be reachable.
