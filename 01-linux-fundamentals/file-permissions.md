# Linux File Permissions

## Permission model

Linux permissions are assigned to three classes:

- **User (u):** file owner.
- **Group (g):** users belonging to the file's group.
- **Other (o):** everyone else.

Permission values:

| Permission | Symbol | Numeric value |
|---|---|---:|
| Read | `r` | 4 |
| Write | `w` | 2 |
| Execute | `x` | 1 |
| None | `-` | 0 |

Example:

```text
-rwxr-x---
```

This means owner has `rwx` (7), group has `r-x` (5), and others have no permissions (0): numeric mode `750`.

## Inspect permissions

```bash
ls -l file.txt
stat file.txt
```

## Change permissions with chmod

```bash
chmod 640 file.txt
chmod u+x script.sh
chmod g-w shared.txt
chmod o-r secret.txt
```

Common numeric modes:

| Mode | Meaning |
|---|---|
| `600` | Owner read/write only |
| `640` | Owner read/write; group read |
| `644` | Owner read/write; everyone else read |
| `700` | Owner full access only |
| `750` | Owner full; group read/execute |
| `755` | Owner full; others read/execute |

## Change ownership

```bash
sudo chown alice file.txt
sudo chown alice:developers file.txt
sudo chgrp developers file.txt
sudo chown -R alice:developers /srv/project
```

Use recursive ownership changes carefully. Confirm the target path before running them.

## Practical lab

```bash
mkdir permission-lab
cd permission-lab
touch private.txt shared.txt
chmod 600 private.txt
chmod 640 shared.txt
ls -l
```

Explain why a private file should not be world-readable. Test access using separate non-privileged accounts if available.

## Important directory permission note

For directories:
- Read allows listing names.
- Write allows creating/removing entries (normally together with execute).
- Execute allows traversing/searching the directory.

## Exercises

1. Create a file readable and writable only by its owner (`600`).
2. Create a shared file with mode `640`.
3. Create a script and make it executable by the owner.
4. Change a test directory's owner and group.
5. Explain the difference between file and directory execute permissions.
