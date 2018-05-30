#! /bin/bash -x

setenforce permissive
systemctl stop firewalld.service
systemctl disable firewalld.service

yum -y install epel-release
yum -y install git httpd dhcpd dnsmasq syslinux genisoimage memtest86+

mkdir -p /var/www/html/os

# Find and mount all isos, mountpoint is volume id
for dev in /dev/sr* ; do
  dir="`isoinfo -d -i ${dev} | awk -F:\  '/Volume id:/{print $2}' | sed -e 's/ /_/g'`"
  mkdir -p /var/www/html/os/${dir}
  mount -o loop,ro ${dev} /var/www/html/os/${dir}
done

# dhcp
ln -f -s /vagrant/dnsmasq.conf /etc/dnsmasq.conf
ln -f -s /vagrant/dnsmasq_static_hosts.conf /etc/dnsmasq_static_hosts.conf

# kickstarts
mkdir -p /var/www/html/build/kickstarts
git clone https://github.com/PastaMasta/pxe-builds.git /var/www/html/build/kickstarts

# pxe menus
mkdir -p /var/lib/tftpboot/
ln -f -s /vagrant/pxelinux.cfg /var/lib/tftpboot/pxelinux.cfg

# tftp server
mkdir -p /var/lib/tftpboot/bootimages
cp -r /usr/share/syslinux/* /var/lib/tftpboot

mkdir /var/lib/tftpboot/bootimages/diag
cp /boot/memtest86+-5.01 /var/lib/tftpboot/bootimages/diag/memtest

# Lets go!
systemctl start httpd.service
systemctl start dnsmasq.service

# per-build os stuff
for centos in /var/www/html/os/CentOS* ; do
  dir="`basename ${centos}`"
  mkdir -p /var/lib/tftpboot/bootimages/installers/${dir}/
  cp ${centos}/images/pxeboot/vmlinuz  /var/lib/tftpboot/bootimages/installers/${dir}/
  cp ${centos}/images/pxeboot/initrd.img  /var/lib/tftpboot/bootimages/installers/${dir}/
done

mkdir -p /var/www/html/os/CentOS/7/os/
ln -s /var/www/html/os/CentOS_7_x86_64/ /var/www/html/os/CentOS/7/os/x86_64
