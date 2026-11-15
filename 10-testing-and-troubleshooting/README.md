# 10 - Testing and Troubleshooting

## Objective

Use a repeatable method to isolate SSH, IP, DNS, port, firewall, and web-server problems.

## Troubleshooting sequence

1. Confirm the VM is running.
2. Confirm the destination IP address is correct.
3. Check network routing and the cloud NSG.
4. Check the Linux firewall.
5. Confirm the service is running.
6. Confirm the service is listening on the expected address and port.
7. Test from the server, then from an external client.
8. Review logs.

## SSH tests

Client:

```bash
ssh -v username@SERVER_PUBLIC_IP
nc -zv SERVER_PUBLIC_IP 22
```

Server:

```bash
sudo systemctl status ssh
sudo ss -tulnp | grep ':22'
sudo journalctl -u ssh -n 50
```

## IP and route tests

```bash
ip addr
ip route
ping -c 4 1.1.1.1
```

Remember that ICMP can be blocked. A failed ping alone does not prove that TCP services are unreachable.

## DNS tests

```bash
getent hosts example.com
dig example.com
nslookup example.com
```

## Port tests

```bash
sudo ss -tulpen
nc -zv SERVER_PUBLIC_IP 80
nc -zv SERVER_PUBLIC_IP 443
```

## Web tests

```bash
curl -I http://localhost
curl -v http://SERVER_PUBLIC_IP
```

## Common symptoms

| Symptom | Possible causes | Checks |
|---|---|---|
| SSH timeout | NSG, UFW, routing, wrong IP | NSG rule, `ufw status`, VM state |
| SSH refused | SSH service stopped or not listening | `systemctl status ssh`, `ss -tulnp` |
| SSH public-key denied | Wrong user/key or key permissions | `ssh -v`, `authorized_keys` |
| Website timeout | Port 80 filtered or route issue | NSG, UFW, `nc`, `ss` |
| HTTP 403 | File/directory permissions or Nginx config | Nginx error log, `namei -l` |
| HTTP 404 | Wrong root or missing file | Nginx server block, file path |
| DNS failure | Resolver or record issue | `resolvectl status`, `dig` |
| Nginx fails to start | Invalid config or port conflict | `nginx -t`, `journalctl`, `ss` |

## Evidence template

Record the following in `11-final-project/testing-results.md`:

- Test date:
- Source machine:
- Destination:
- Command:
- Expected result:
- Actual result:
- Pass/Fail:
- Notes (do not include secrets):

## Completion checklist

- [ ] Test SSH.
- [ ] Test IP connectivity.
- [ ] Test DNS resolution.
- [ ] Test ports 22 and 80.
- [ ] Test HTTP response.
- [ ] Record and explain any troubleshooting performed.
