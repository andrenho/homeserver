Building:

```
docker build -t certificate .
```

Running:

```
docker run --name=certificate certificate -e "EMAIL=my@email.com" -e "HOSTNAME=my.domain.com" -e "EXTRA_PARAMS=--staging" -v "${HOME}/.aws/credentials:.aws/credentials:ro"
```
