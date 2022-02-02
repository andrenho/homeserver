Building:

```
docker build -t certificate .
```

Running:

```
docker run --name=certificate -e "EMAIL=my@email.com" -e "HOSTNAME=my.domain.com" -e "EXTRA_PARAMS=--staging" -v "${HOME}/.aws/credentials:/root/.aws/credentials:ro" -v "/tmp/ssl:/ssl" -v "/tmp/vlets:/var/lib/letsencrypt" -v "/tmp/elets:/etc/letsencrypt" certificate
```
