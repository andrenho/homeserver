# Web apps

- [X] SFTP
- [X] File manager (share downloads, homeserver\_data, root)
- [X] Programmer application
- [X] News aggregator (https://hub.docker.com/r/clue/ttrss)
- [X] Book manager
  - [X] Calibre
- [X] E-book manager
- [X] Audiobooks
- [X] Podcasts (podgrab)
- [ ] Note taking (Plainpad)
- [ ] Password manager (Vaultwarden?)
- [ ] Games
- [ ] TODO app
- [ ] Read it later (wallabag)
- [ ] Stuff for software development (Regexr)
- [ ] Check other projects in https://www.linuxserver.io/

# Development

- [ ] Create new homepage with apps, graphs (CPU, RAM...), last backup date, start/stop services, and news
  - Describe SFTP, FTP, SSH (?) servers
- [ ] Write software to run kindlegen

# Infrastructure

- [X] Reorganize downloads folder (prepare for new HD)
- [X] Software development container (c & web)
  - [X] install all packages
  - [X] map volumes (home and Dockerfile)
  - [X] configure dotfiles
  - [X] redirect a few ports
- [X] Backup to other server and cloud (https://www.duplicati.com/, https://docs.linuxserver.io/images/docker-duplicati)
- [X] FTP server only for local network
- [ ] PiKVM
- [ ] PiHole
- [ ] Protect machine with firewall (ufw?) - protect FTP port
- [ ] Is backup working?

# Configuration

- [ ] Configure sonarr & radarr & bazarr
- [ ] Configure RSS feeds
- [ ] Remove simple auth from audible to configure Android

# Major infrastructre changes

- [ ] Move to IPv6, open port 433 on router
- [ ] Move to ansible
- [ ] Make the installation generic for any IP, network, timezone, domain, and user name
  - Centralize passwords

# Find new stuff

- [ ] View all linuxserver services (in docker)
- [ ] https://github.com/awesome-selfhosted/awesome-selfhosted, Miscelaneous
