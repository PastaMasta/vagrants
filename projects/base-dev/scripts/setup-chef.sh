#! /bin/bash -x

if [[ -e /root/zfs_step ]] ; then
  case `cat /root/zfs_step` in
    3) echo "Zfs is ready!" ;;
    *) echo "Zfs not ready!" ; exit 1;;
  esac
fi

ChefServer='chef.localdomain'
ChefServerFlat="`echo ${ChefServer}|sed 's/\./_/g'`"

# Install Chef
yum -y install wget
yum -y install http://repo/software/Chef/chef-13.8.5-1.el7.x86_64.rpm

# Get all the relevent chef config files
mkdir -p /etc/chef
cd /etc/chef/
wget -q http://repo/build/chef/client.rb
wget -q http://repo/build/chef/validation.pem
wget -q http://repo/build/chef/initial.json

# Download the SSL certs
mkdir -p /etc/chef/trusted_certs
openssl s_client -showcerts -connect ${ChefServer}:443 </dev/null 2>/dev/null|openssl x509 -outform PEM > /etc/chef/trusted_certs/${ChefServerFlat}.crt

setenforce permissive

# Run the inital chef client
chef-client -r chef-`uname -n`-dev
sleep 3
chef-client

exit $?
