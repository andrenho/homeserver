# homeserver

## On the server  (start Arch installation)

```
#                         # Start the system with latest Arch Linux installation media
# iwctl --passphrase "[WIFI_KEY]" station [WIFI_INTERFACE] connect "[WIFI_ESSID]"      # (Optional) Connect to WIFI network. _ip link show_ to know WIFI_INTERFACE.
# passwd                  # Set a password for the root user
# ip address              # Get IP to run install remotely
```

## On the client (finish Arch installation)

```
$ ssh root@SERVER-IP
# curl -sL https://bit.ly/2F3CATp | bash              # Install alis
# curl https://shorturl.at/tuyWY > alis.conf          # Edit to change preferences  (add WI-FI preferences!)
# curl https:/shorturl.at/nrEOP > alis-packages.conf  # Edit to change preferences
# ./alis.sh               # Start installation
```
