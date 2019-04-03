#! /bin/bash

yum install -y https://yum.puppet.com/puppet6/puppet-release-el-7.noarch.rpm
yum install -y puppetserver

# Vagrant wierdness?
sed -i -e 's/master/master puppet/' /etc/hosts

/opt/puppetlabs/bin/puppetserver ca setup

systemctl start puppetserver.service
systemctl enable puppetserver.service
