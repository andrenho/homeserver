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
- [ ] Stuff for software development (Regexr)
- [ ] Note taking (Plainpad)
- [ ] Password manager (Vaultwarden?)
- [ ] TODO app
- [ ] Read it later (wallabag)
- [ ] Check other projects in https://www.linuxserver.io/

# Development

- [ ] Write software to run kindlegen
- [ ] Create new homepage with apps, graphs (CPU, RAM...), last backup date, start/stop services, and news
  - Describe SFTP, FTP, SSH (?) servers

# Infrastructure

- [X] Reorganize downloads folder (prepare for new HD)
- [X] Software development container (c & web)
  - [X] install all packages
  - [X] map volumes (home and Dockerfile)
  - [X] configure dotfiles
  - [X] redirect a few ports
- [X] Backup to other server and cloud (https://www.duplicati.com/, https://docs.linuxserver.io/images/docker-duplicati)
- [X] FTP server only for local network
- [ ] PiHole
- [ ] Protect machine with firewall (ufw?) - protect FTP port
- [ ] PiKVM
- [ ] Is backup working?

# Configuration

- [ ] Configure RSS feeds
- [ ] Remove simple auth from audible to configure Android
- [ ] Configure sonarr & radarr & bazarr

# Major infrastructre changes

- [ ] Move to IPv6, open port 433 on router
- [ ] Move to ansible
- [ ] Make the installation generic for any IP, network, timezone, domain, and user name
  - Centralize passwords
