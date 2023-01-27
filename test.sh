
gsed -i s/"systemctl "/"echo systemctl "/g hst-install-ubuntu.sh
gsed -i s/"systemctl .*|.*"/'systemctl)"'/g hst-install-ubuntu.sh
gsed -i s/"phpfpm='yes'"/"echo phpfpm='yes'"/g hst-install-ubuntu.sh