#!/bin/bash

if [ "$#" -ne 1 ]; then
    echo "Usage: ${0} <domains>"
    exit 1
fi

DOMAIN=${1}
cp init-letsencrypt.sh.orig init-letsencrypt.sh
cp data/apache/extra/httpd-ssl.conf.orig data/apache/extra/httpd-ssl.conf
sed -i "s/^domains=.example.org www.example.org..*/domains=(${DOMAIN})/g" init-letsencrypt.sh
sed -i "s#\(.*\)\(example.org\/\)#\1${DOMAIN}\/#g" data/apache/extra/httpd-ssl.conf