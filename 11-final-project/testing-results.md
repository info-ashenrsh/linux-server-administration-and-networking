# Testing Results

Complete this document after running the tests. Replace the example placeholders with your actual observations. Do not claim a test passed unless you ran it.

## Environment

- Date:
- Azure region:
- Ubuntu version:
- VM name (optional; omit in public repo if sensitive):
- Test client OS:

## Test cases

| ID | Test | Command / method | Expected result | Actual result | Status |
|---|---|---|---|---|---|
| T01 | SSH access | `ssh USER@PUBLIC_IP` | Login succeeds with key | | |
| T02 | Host identity | `hostnamectl` | Correct Ubuntu VM | | |
| T03 | IP configuration | `ip addr` | Private IP present | | |
| T04 | Route | `ip route` | Default route present | | |
| T05 | Firewall | `sudo ufw status verbose` | Only intended rules | | |
| T06 | Nginx service | `systemctl is-active nginx` | `active` | | |
| T07 | Listening port | `sudo ss -tulnp` | TCP 80 listening | | |
| T08 | Local HTTP | `curl -I http://localhost` | HTTP 200 | | |
| T09 | External HTTP | `curl -I http://PUBLIC_IP` | HTTP 200 | | |
| T10 | NSG review | Azure portal | Only required inbound rules | | |

## Issues encountered

### Issue 1

- Symptom:
- Root cause:
- Resolution:
- Verification:

## Final result

Summarize which acceptance criteria passed, any known limitations, and whether Azure resources were deleted after the lab.
