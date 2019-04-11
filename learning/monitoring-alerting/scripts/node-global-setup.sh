#! /bin/bash

yum install -y epel-release

# Example app:
yum install -y httpd
systemctl enable httpd.service
systemctl start httpd.service
echo "Hello world! I am `uname -n`" > /var/www/html/index.html

# Nagios
yum install -y nrpe nagios-plugins-all
ln -f -s /vagrant/nagios/nrpe.cfg /etc/nagios/nrpe.cfg
systemctl enable nrpe.service
systemctl start nrpe.service

# Netdata
yum install -y autoconf automake curl gcc git libmnl-devel libuuid-devel lm_sensors make MySQL-python nc pkgconfig python python-psycopg2 PyYAML zlib-devel
git clone https://github.com/netdata/netdata.git /root/netdata

exit 0
#/root/netdata/netdata-installer.sh --dont-wait

ln -f -s /vagrant/netdata/netdata-`uname -n`.conf /etc/netdata/netdata.conf
systemctl restart netdata.service
