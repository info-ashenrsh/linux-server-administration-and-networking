# Linux Cheatsheet

| Task | Command |
|---|---|
| Current path | `pwd` |
| List files | `ls -lah` |
| Change directory | `cd PATH` |
| Create directory | `mkdir -p PATH` |
| Copy | `cp SOURCE DEST` |
| Move/rename | `mv SOURCE DEST` |
| Read file | `cat FILE` |
| Search text | `grep -n "TEXT" FILE` |
| Find file | `find PATH -name "NAME"` |
| Permissions | `chmod 640 FILE` |
| Ownership | `sudo chown USER:GROUP FILE` |
| User identity | `id USER` |
| Processes | `ps aux` |
| Service status | `systemctl status SERVICE` |
| Logs | `journalctl -u SERVICE` |
| Disk space | `df -h` |
| Memory | `free -h` |
| Network addresses | `ip addr` |
| Routes | `ip route` |
| Listening ports | `sudo ss -tulpen` |
