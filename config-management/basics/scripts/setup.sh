#! /bin/bash

echo "Setting up: `uname -n`"

setenforce 0
systemctl stop firewalld.service
systemctl disable firewalld.service

# Just installs all the clients etc required for it to work

###############################################################################
# Ansible

yum install ansible -y
ln -f -s /vagrant/ansible/hosts /etc/ansible/hosts
cp /vagrant/keys/* ~vagrant/.ssh/
cat ~vagrant/.ssh/id_rsa.pub >> ~vagrant/.ssh/authorized_keys

###############################################################################
# Chef

yum install -y https://packages.chef.io/files/stable/chef/14.11.21/el/7/chef-14.11.21-1.el7.x86_64.rpm
ln -f -s /vagrant/chef/cookbooks /root/cookbooks

###############################################################################
# Cfengine


###############################################################################
# Puppet

###############################################################################
# Salt
