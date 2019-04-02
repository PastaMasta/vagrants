#! /bin/bash

set -x
[[ `uname -n` != "basic" ]] && exit 1

yum remove httpd -y
rm -rf /var/www/html
