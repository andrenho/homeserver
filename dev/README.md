Type `ssh dev` to connect to the dev instance. Make sure that the
private key is in `~/.ssh/homeserver-dev.key`.

The ports between 7000 and 7003 are open to the outside world.

Port 7443 and 7444 are SSL ports open to the outside world. A nginx reverse
proxy does the SSL offload to the local ports 7080 and 7081, respectively.
