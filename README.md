# homeserver

```
#                         # Start the system with latest Arch Linux installation media
# iwctl --passphrase "[WIFI_KEY]" station [WIFI_INTERFACE] connect "[WIFI_ESSID]"      # (Optional) Connect to WIFI network. _ip link show_ to know WIFI_INTERFACE.

#                         # If a remote install is desired...
# passwd                  # Set a password for the root user
# ip address              # Get IP to run install remotely
$ ssh root@SERVER-IP      # Run this on the client

#                         # Continue installation...
# curl -sL https://bit.ly/2F3CATp | bash              # Install alis
# curl https://raw.githubusercontent.com/andrenho/homeserver/master/arch/alis.conf > alis.conf          # Edit to change preferences  (add WI-FI preferences!)
# ./alis.sh               # Start installation

#
# REBOOT
#

# # Setup wi-fi and sudo
$ sudo pacman -S git
$ git clone https://XXXX:XXXX@github.com/andrenho/homeserver.git
$ cd homeserver
$ sudo ./install.sh
```
