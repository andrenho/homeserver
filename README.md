# homeserver

## On the server

```
#                         # Start the system with latest Arch Linux installation media
# loadkeys [keymap]       # Load keyboard keymap, eg. loadkeys es, loadkeys us, loadkeys de
# iwctl --passphrase "[WIFI_KEY]" station [WIFI_INTERFACE] connect "[WIFI_ESSID]"           # (Optional) Connect to WIFI network. _ip link show_ to know WIFI_INTERFACE.
# curl -sL https://bit.ly/2F3CATp | bash                                                    # Install alis
# curl https://raw.githubusercontent.com/andrenho/homeserver/master/arch/alis.conf          # Edit to change preferences
# curl https://raw.githubusercontent.com/andrenho/homeserver/master/arch/alis-packages.conf # Edit to change preferences
# ./alis.sh               # Start installation
```
