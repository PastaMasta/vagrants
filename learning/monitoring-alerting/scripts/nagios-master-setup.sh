#! /bin/bash

yum install -y epel-release
yum install -y nagios nagios-plugins-all nagios-plugins-nrpe

ln -f -s /vagrant/nagios/nagios.cfg /etc/nagios/nagios.cfg
ln -f -s /vagrant/nagios/objects/commands.cfg /etc/nagios/objects/commands.cfg
mkdir /etc/nagios/servers
ln -f -s /vagrant/nagios/servers/servers.cfg /etc/nagios/servers/servers.cfg

systemctl enable httpd.service nagios.service
systemctl start httpd.service nagios.service
