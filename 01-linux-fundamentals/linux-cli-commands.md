# Linux CLI Commands - Reference

## Navigation

```bash
pwd
ls
ls -la
cd /etc
cd ..
cd ~
```

## File operations

```bash
mkdir project
mkdir -p project/src project/docs
touch project/README.md
cp project/README.md project/README-copy.md
mv project/README-copy.md project/NOTES.md
rm project/NOTES.md
```

## Reading and searching

```bash
cat /etc/os-release
less /var/log/syslog
head -n 15 /etc/passwd
tail -n 20 /var/log/syslog
grep -i "error" application.log
find /etc -name "*.conf" 2>/dev/null
```

## System information

```bash
hostname
hostnamectl
uname -a
uptime
whoami
id
date
free -h
df -h
lsblk
```

## Help

```bash
man ls
ls --help
```

Use `man COMMAND` to read the manual page. Press `q` to exit `less`-style manual pages.
