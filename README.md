# docker-hestia

Hestia running in docker

## Docker Compose
```
version: "3.8"

services:
  hestia:
    # build: https://github.com/dkyeremeh/docker-hestia.git
    build:
      context: .
      args:
        - NAMED=yes
    image: hestia:demo
```


Build Arguments
| ARG Name | Default Value|
| --- | --- |
| EMAIL | email@domain.tld |
| PASSWORD | password |
| HOSTNAME | hosting.hestia.localhost |
| APACHE | no |
| PHPFPM | no |
| NAMED | no |
| VSFTPD | no |
| PROFTPD | no |
| IPTABLES | no |
| FAIL2BAN | no |
| QUOTA | no |
| EXIM | no |
| DOVECOT | no |
| SPAMASSASSIN | no |
| CLAMAV | no |
| MYSQL | no |
| POSTGRESQL | no

    