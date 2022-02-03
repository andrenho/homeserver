# homeserver

# Running in test environment

1. Create a temporary directory with `mkdir /tmp/data /tmp/volume`.
2. Run homeserver with `docker-compose up -d`.

All services have `admin/admin` as user and password.

The following services are now available:

- FTP: `ftp://admin:admin@localhost:221`
- SFTP: `sftp://admin:admin@localhost:22222`
- HTTPS: `https://admin:admin@dev.homeserver.gamesmith.uk:2443`

---

# Running in production

## Operating system installation

1. Start the system with latest Arch Linux installation media.
2. Connect to wi-fi if needed:

```
# iwctl --passphrase "[WIFI_KEY]" station [WIFI_INTERFACE] connect "[WIFI_ESSID]"
```

3. (OPTIONAL) To continue installation remotely, use the commands below, otherwise skip it.

```
# passwd
# ip address  # Get IP to run install remotely
```

4. Install alis and let it configure arch on the server.

```
# curl -sL https://bit.ly/2F3CATp | bash
# curl https://raw.githubusercontent.com/andrenho/homeserver/master/arch/alis.conf > alis.conf
# ./alis.sh
```

5. Reboot the system after the installation is complete.

## Preparation

1. Open the following ports in the router, all pointing to the homeserver:

| Extern        | Intern      | Used by |
|---------------|-------------|---------|
| Random port   |    22       | SSH, for maintenance |
| 443 (or 8443) |   443       | Homeserver main port |
| 1883          |  1883       | MQTT |
| Random port   |  2222       | SFTP |
| 7000..7003    |  7000.7003  | Development server (unencrypted) |
| 7443,7444     |  7443,7444  | Development server (SSL) [internally, offloaded to 7080 and 7081] |
| 32400         | 32400       | Plex |

Do **not** open port 21, as these are used for internal unsecure FTP.

## Homeserver installation

1. Connect to the internet, if on wi-fi, and do basic preparations:

```
# nmcli device wifi connect ESSID password XXXXXXX   # (if on wi-fi)
# sudo pacman -S sshd
# systemctl enable sshd
# systemctl start sshd
```

2. From another computer:
  - close `https://github.com/andrenho/home-ansible`
  - edit variables files (in `global_vars`)
  - run ansible for this server

3. The homeserver should be up and running now.
