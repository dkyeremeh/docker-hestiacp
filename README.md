# docker-hestia

Hestia running in docker

## Docker Compose
```
version: "3.8"

services:
  hestia:
    build:
      context: "https://github.com/dkyeremeh/docker-hestia.git"
    image: hestia:demo
```


Environmental variables
    ADMIN_EMAIL
    ADMIN_PASSWORD
    HOSTNAME

    