FROM ubuntu

RUN apt update
RUN apt install -y wget lsb-core

WORKDIR /var/install

RUN wget https://raw.githubusercontent.com/hestiacp/hestiacp/release/install/hst-install-ubuntu.sh
RUN wget https://raw.githubusercontent.com/gdraheim/docker-systemctl-replacement/master/files/docker/systemctl3.py -O /usr/local/bin/systemctl

RUN chmod +x hst-install-ubuntu.sh
RUN chmod +x /usr/local/bin/systemctl

RUN sed -i s/"systemctl start"/"echo systemctl start"/g hst-install-ubuntu.sh
RUN sed -i s/"systemctl restart"/"echo systemctl restart"/g hst-install-ubuntu.sh
RUN sed -i s/"^.*can't create \$servername domain.*"//g hst-install-ubuntu.sh


ARG EMAIL=email@domain.tld
ARG PASSWORD=password
ARG HOSTNAME=hestia.domain.localhost
ARG APACHE=no
ARG PHPFPM=no
ARG NAMED=no
ARG VSFTPD=no
ARG PROFTPD=no
ARG IPTABLES=no
ARG FAIL2BAN=no
ARG QUOTA=no
ARG EXIM=no
ARG DOVECOT=no
ARG SPAMASSASSIN=no
ARG CLAMAV=no
ARG MYSQL=no
ARG POSTGRESQL=no

RUN bash hst-install-ubuntu.sh -f\
    --interactive no\
    --email ${EMAIL}\
    --password ${PASSWORD}\
    --hostname ${HOSTNAME} \
    --apache ${APACHE} \
    --phpfpm ${PHPFPM} \
    --named ${NAMED} \
    --vsftpd ${VSFTPD} \
    --proftpd ${PROFTPD} \
    --iptables ${IPTABLES} \
    --fail2ban ${FAIL2BAN} \
    --quota ${QUOTA} \
    --exim ${EXIM} \
    --dovecot ${DOVECOT} \
    --spamassassin ${SPAMASSASSIN} \
    --clamav ${CLAMAV} \
    --mysql ${MYSQL} \
    --postgresql ${POSTGRESQL}

RUN mkdir -p scripts
COPY scripts/* scripts
RUN ls -la scripts

ENTRYPOINT  [ "/bin/sh", "/var/install/scripts/start.sh" ] 