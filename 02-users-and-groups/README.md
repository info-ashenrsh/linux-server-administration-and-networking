# 02 - Users and Groups

## Objective

Manage local Linux accounts, groups, passwords, and administrative privileges using least privilege.

## Inspect accounts

```bash
whoami
id
id username
getent passwd
getent group
groups username
```

`/etc/passwd` contains account metadata, not users' plaintext passwords. Password hashes are stored separately and should never be shared.

## Create users and groups

```bash
sudo adduser developer1
sudo groupadd developers
sudo usermod -aG developers developer1
id developer1
groups developer1
```

On Ubuntu, `adduser` is an interactive helper. `useradd` is a lower-level command with different defaults.

## Create a shared project directory

```bash
sudo mkdir -p /srv/development
sudo chown root:developers /srv/development
sudo chmod 2770 /srv/development
ls -ld /srv/development
```

The leading `2` sets the setgid bit on the directory so new items inherit the directory's group on typical Linux filesystems.

## Sudo privileges

Ubuntu commonly grants administrative rights through membership in the `sudo` group:

```bash
sudo usermod -aG sudo developer1
```

Group membership is applied to new login sessions. Log out and back in before testing.

Check sudo access:

```bash
sudo -l -U developer1
```

Use `visudo` to edit sudoers safely:

```bash
sudo visudo
```

Avoid giving users unrestricted sudo unless they genuinely require it.

## Remove test accounts

```bash
sudo deluser developer1
sudo deluser --remove-home developer1
```

The second command also removes the user's home directory. Use only for a disposable lab account after confirming there is no needed data.

## Practical lab

1. Create `developer1` and `tester1`.
2. Create groups `developers` and `testers`.
3. Add each user to the matching group.
4. Create `/srv/development` and `/srv/testing`.
5. Assign each directory to the matching group.
6. Apply permissions so only the intended group can access its directory.
7. Verify with `id`, `groups`, and `ls -ld`.

## Troubleshooting

- Group membership not updated: start a new login session.
- `user is not in the sudoers file`: inspect group membership and sudo policy; do not edit sudoers with a normal text editor.
- Permission denied: inspect every parent directory's execute permission as well as the target file's mode.

## Completion checklist

- [ ] Create and inspect users.
- [ ] Create groups and assign memberships.
- [ ] Configure a shared directory.
- [ ] Explain sudo and least privilege.
- [ ] Remove only disposable lab accounts safely.
