#! /bin/bash

echo "Setting up: `uname -n`"

#
# Just installs all the clients etc required for it to work
#

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
# CFEngine


###############################################################################
# Puppet

# yum install -y https://yum.puppet.com/puppet6/puppet-release-el-7.noarch.rpm
# yum install -y puppet-agent

# /opt/puppetlabs/bin/puppet config set server puppet-master

# systemctl start puppet.service
# systemctl enable puppet.service


###############################################################################
# Salt

yum install -y https://repo.saltstack.com/yum/redhat/salt-repo-latest.el7.noarch.rpm 
yum install -y salt-minion
ln -f -s /vagrant/salt/minion /etc/salt/minion

systemctl enable salt-minion.service
systemctl start salt-minion.service
