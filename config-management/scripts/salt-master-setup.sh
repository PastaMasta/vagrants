#! /bin/bash

yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest.el7.noarch.rpm 
yum install -y salt-master salt-minion salt-ssh salt-syncdic salt-cloud salt-api

systemctl enable salt-master.service
systemctl start salt-master.service

ln -f -s /vagrant/salt/srv-salt/ /srv/salt
