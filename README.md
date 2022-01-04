# homeserver

1. Start the system with latest Arch Linux installation media.
1. Connect to wi-fi if needed:

```
# iwctl --passphrase "[WIFI_KEY]" station [WIFI_INTERFACE] connect "[WIFI_ESSID]"
```

1. (OPTIONAL) To continue installation remotely, use the commands below, otherwise skip it.

```
# passwd      # Set a password for the root user
# ip address  # Get IP to run install remotely
```

1. Configure arch on the server, or connected by SSH:

```
# curl -sL https://bit.ly/2F3CATp | bash              # Install alis
# curl https://raw.githubusercontent.com/andrenho/homeserver/master/arch/alis.conf > alis.conf          # Edit to change preferences
# ./alis.sh               # Start installation
```

1. Reboot the system after installation is complete, and install the homeserver.

```
# # Setup wi-fi and sudo
# nmcli device wifi connect ESSID password XXXXXXX
# sudo pacman -S git sudo
# visudo
$ git clone https://XXXX:XXXX@github.com/andrenho/homeserver.git
$ cd homeserver
$ sudo ./install.sh
```
