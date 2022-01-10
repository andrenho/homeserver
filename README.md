# homeserver

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
| Random port   |  2222       | SFTP |
| 7000..7003    |  7000.7003  | Development server |
| 32400         | 32400       | Plex |

## Homeserver installation

1. Connect to the internet, if on wi-fi, and do basic preparations:

```
# nmcli device wifi connect ESSID password XXXXXXX
# sudo pacman -S git sudo vim
# groupadd sudo
# useradd -G sudo andre
```

2. Install secrets
  - Add the AWS credentials and config file to `/home/andre/.aws/`
  - Create a file in '/home/andre/secrets/sftp-users.conf' with the following format: `andre_nho:PASSWORD:1000:1000`
    - Replace `PASSWORD` by a password generated with:
```
echo -n "your-password" | docker run -i --rm atmoz/makepasswd --crypt-md5 --clearfrom=-
```

3. Create SSL certificates
```
$ ./certificate/request_certificate.sh
```

3. Possibly restore backups to `~/volume/data/`, if any.

4. Install the homeserver:

```
$ git clone https://XXXX:XXXX@github.com/andrenho/homeserver.git
$ cd homeserver
$ ./scripts/add_password.sh       # add password for homeserver admin
$ ./scripts/user_config.sh        # create user directories
$ ./scripts/update_packages.sh    # update pacman packages
$ ./scripts/install_dash.sh       # install linux-dash
$ ./scripts/run_containers.sh     # build and run containers
```
