FROM ubuntu

WORKDIR /var/install

RUN wget https://raw.githubusercontent.com/hestiacp/hestiacp/release/install/hst-install.sh
RUN chmod +x hst-install.sh

ENV PASSWORD=password
ENV HOSTNAME=localhost


RUN bash hst-install.sh -f\
    --interactive no\
    --email email@domain.tld\
    --password ${PASSWORD}\
    --hostname ${HOSTNAME} \
    --nginx no\
    --apache no\
    --phpfpm no\
    --named yes\
    --remi no\
    --vsftpd no\
    --proftpd no\
    --iptables no\
    --fail2ban no\
    --quota no\
    --exim no\
    --dovecot no\
    --spamassassin no\
    --clamav no\
    --mysql no\
    --postgresql no