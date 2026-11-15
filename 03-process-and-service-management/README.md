# 03 - Process and Service Management

## Objective

Inspect running programs, understand process IDs, control processes, manage `systemd` services, and inspect logs.

## Process inspection

```bash
ps aux
ps -ef
pgrep -a nginx
top
```

Install `htop` if desired:

```bash
sudo apt update
sudo apt install htop
htop
```

## Process signals

```bash
kill PID
kill -TERM PID
kill -KILL PID
```

Prefer `TERM` first so a process can shut down cleanly. `KILL` cannot be caught and should be a last resort. Replace `PID` with a real process ID.

## systemd service management

```bash
systemctl status ssh
sudo systemctl start nginx
sudo systemctl stop nginx
sudo systemctl restart nginx
sudo systemctl reload nginx
sudo systemctl enable nginx
sudo systemctl disable nginx
systemctl is-active nginx
systemctl is-enabled nginx
```

- `start` starts a service now.
- `enable` configures it to start at boot.
- `restart` stops and starts it.
- `reload` asks a service to reload configuration when supported.

## Logs with journalctl

```bash
sudo journalctl -u nginx
sudo journalctl -u nginx -n 50
sudo journalctl -u nginx -f
sudo journalctl -p warning
```

Press `Ctrl+C` to stop following logs.

## Resource monitoring

```bash
uptime
free -h
df -h
du -sh /var/log
vmstat 1 5
```

## Practical lab

1. Install Nginx.
2. Check its status.
3. Stop it and confirm it is inactive.
4. Start it again.
5. Enable it at boot.
6. Inspect its recent logs.
7. Find the Nginx process with `pgrep` or `ps`.

## Troubleshooting workflow

1. Check service state: `systemctl status SERVICE`.
2. Inspect logs: `journalctl -u SERVICE -n 100`.
3. Check configuration syntax if the service supports a test command.
4. Check whether the required port is already in use: `sudo ss -tulnp`.
5. Fix the underlying issue and restart/reload the service.

## Completion checklist

- [ ] Explain PID and process signals.
- [ ] Inspect processes using `ps` and `top`.
- [ ] Start, stop, restart, and enable a service.
- [ ] Read service logs with `journalctl`.
