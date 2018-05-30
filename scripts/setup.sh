#! /bin/bash -x

setenforce permissive
systemctl stop firewalld.service
systemctl disable firewalld.service

yum -y install epel-release wget

mkdir -p /var/www/html/os

yum -y install git httpd dhcpd dnsmasq syslinux

# dhcp
ln -f -s /vagrant/dnsmasq.conf /etc/dnsmasq.conf
ln -f -s /vagrant/dnsmasq_static_hosts.conf /etc/dnsmasq_static_hosts.conf

# kickstarts
git clone https://github.com/PastaMasta/pxe-builds.git /var/www/html/build


# tftp server

mkdir -p /var/lib/tftpboot/bootimages
cd /var/lib/tftpboot/bootimages

cp -r /usr/share/syslinux/* /var/lib/tftpboot

mkdir diag
cp /var/www/html/os/isolinux/memtest ./diag/

mkdir -p ./installers/centos7/
cp /var/www/html/os/images/pxeboot/vmlinuz  ./installers/centos7
cp /var/www/html/os/images/pxeboot/initrd.img  ./installers/centos7

cd -

# pxe menus
ln -f -s /vagrant/pxelinux.cfg /var/lib/tftpboot/pxelinux.cfg

# Lets go!
systemctl start httpd.service
systemctl start dnsmasq.service

echo "Setup complete!"
