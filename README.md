# homeserver

1. Start the system with latest Arch Linux installation media.
1. Connect to wi-fi if needed:

```
# iwctl --passphrase "[WIFI_KEY]" station [WIFI_INTERFACE] connect "[WIFI_ESSID]"
```

1. (OPTIONAL) To continue installation remotely, use the commands below, otherwise skip it.

```
# passwd
# ip address  # Get IP to run install remotely
```

1. Install alis and let it configure arch on the server.

```
# curl -sL https://bit.ly/2F3CATp | bash
# curl https://raw.githubusercontent.com/andrenho/homeserver/master/arch/alis.conf > alis.conf
# ./alis.sh
```

1. Reboot the system after installation is complete, and install the homeserver. 
  - Make sure to add the AWS credentials file.
  - Place SSL certificates into the location below.

```
# nmcli device wifi connect ESSID password XXXXXXX
# sudo pacman -S git sudo vim
# groupadd sudo
# useradd -G sudo andre
$ git clone https://XXXX:XXXX@github.com/andrenho/homeserver.git
$ # Place SSL certificates into homeserver/ssl_offload/cert (certificate.crt and private.key)
$ cd homeserver
$ ./install.sh
```
