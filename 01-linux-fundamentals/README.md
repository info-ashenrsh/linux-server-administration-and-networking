# 01 - Linux Fundamentals

## Objective

Learn to use the Linux command line, understand the filesystem, and perform everyday file and directory operations.

## 1. Open a terminal

Use Ubuntu Terminal or connect to an Ubuntu virtual machine. Commands are case-sensitive.

## 2. Essential CLI commands

| Command | Purpose | Example |
|---|---|---|
| `pwd` | Print current directory | `pwd` |
| `ls` | List directory contents | `ls -lah` |
| `cd` | Change directory | `cd /var/log` |
| `mkdir` | Create directory | `mkdir lab` |
| `touch` | Create empty file/update timestamp | `touch notes.txt` |
| `cp` | Copy files/directories | `cp a.txt b.txt` |
| `mv` | Move or rename | `mv old.txt new.txt` |
| `rm` | Remove files | `rm file.txt` |
| `rmdir` | Remove empty directory | `rmdir empty-dir` |
| `cat` | Print file contents | `cat notes.txt` |
| `less` | View long files | `less /var/log/syslog` |
| `head` | Show first lines | `head -n 10 file.txt` |
| `tail` | Show last lines | `tail -n 20 file.txt` |
| `grep` | Search text | `grep "error" app.log` |
| `find` | Find files | `find . -name "*.md"` |
| `df` | Show filesystem capacity | `df -h` |
| `du` | Show directory size | `du -sh ~/Downloads` |
| `uname` | Kernel/system information | `uname -a` |

## 3. Linux filesystem overview

- `/` - filesystem root.
- `/home` - users' home directories.
- `/etc` - system-wide configuration.
- `/var` - variable data such as logs and web content.
- `/var/log` - system and application logs.
- `/tmp` - temporary files.
- `/usr` - user-space programs and libraries.
- `/bin` and `/sbin` - essential commands (often symlinked into `/usr` on modern Ubuntu).
- `/root` - root user's home directory.
- `/opt` - optional third-party software.

## 4. File and directory operations lab

Run:

```bash
mkdir -p ~/linux-lab/{documents,backup,logs}
cd ~/linux-lab
pwd

touch documents/notes.txt documents/tasks.txt
echo "Linux CLI practice" > documents/notes.txt
echo "1. Create files" >> documents/tasks.txt
echo "2. Copy files" >> documents/tasks.txt

cat documents/notes.txt
cat documents/tasks.txt

cp documents/notes.txt backup/
mv documents/tasks.txt documents/todo.txt

find . -type f -maxdepth 3
ls -lahR
```

Expected result: `linux-lab` contains `documents`, `backup`, and `logs`. The backup folder contains a copy of `notes.txt`, and `documents` contains `notes.txt` and `todo.txt`.

## 5. Redirection and pipes

```bash
# Replace file content
echo "First line" > sample.txt

# Append content
echo "Second line" >> sample.txt

# Send command output to a file
ls -lah > directory-list.txt

# Pipe output into another command
ps aux | grep nginx
```

- `>` replaces a file's contents.
- `>>` appends to a file.
- `|` sends one command's output to another command.

## 6. Practical exercises

1. Create a directory named `server-practice`.
2. Inside it, create `config`, `logs`, and `backup`.
3. Create three `.txt` files in `config`.
4. Put at least two lines of text in each file.
5. Copy all text files into `backup`.
6. Find all `.txt` files below the project directory.
7. Search for a chosen word using `grep`.
8. Display disk usage using `df -h` and `du -sh`.

## 7. Troubleshooting

- `Permission denied`: check ownership and permissions; do not immediately use `sudo`.
- `No such file or directory`: verify spelling and current path with `pwd` and `ls`.
- `command not found`: check the command spelling and whether the required package is installed.
- Be careful with `rm -r` and especially `rm -rf`; deletion may be irreversible.

## Completion checklist

- [ ] Navigate directories using `cd`.
- [ ] Create, copy, move, rename, and delete test files.
- [ ] Read and search file contents.
- [ ] Explain `>`, `>>`, and `|`.
- [ ] Explain the purpose of `/etc`, `/home`, `/var`, and `/var/log`.
