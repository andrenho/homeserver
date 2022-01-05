# homeserver

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

5. Reboot the system after installation is complete, and install the homeserver. 
  - Add the AWS credentials and config file to `/home/andre/.aws/`
  - Place SSL certificates in `/home/andre/homeserver/proxy/cert` after cloning the repository.

```
# nmcli device wifi connect ESSID password XXXXXXX
# sudo pacman -S git sudo vim
# groupadd sudo
# useradd -G sudo andre
$ git clone https://XXXX:XXXX@github.com/andrenho/homeserver.git
$ # Place SSL certificates into homeserver/proxy/cert (certificate.crt and private.key)
$ cd homeserver
$ ./scripts/add_password.sh     # add password for admin
$ ./install.sh
```
