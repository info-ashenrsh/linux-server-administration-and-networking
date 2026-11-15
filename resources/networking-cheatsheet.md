# Networking Cheatsheet

| Task | Command |
|---|---|
| Show IP addresses | `ip addr` |
| Show routes | `ip route` |
| DNS lookup | `dig example.com` |
| Basic name lookup | `getent hosts example.com` |
| ICMP test | `ping -c 4 1.1.1.1` |
| HTTP headers | `curl -I https://example.com` |
| Listening sockets | `sudo ss -tulpen` |
| TCP port test | `nc -zv HOST PORT` |
| Firewall status | `sudo ufw status verbose` |
| SSH connection | `ssh USER@HOST` |

Remember: ping uses ICMP and may be blocked even when TCP services work. A successful port test does not prove the application is secure.
