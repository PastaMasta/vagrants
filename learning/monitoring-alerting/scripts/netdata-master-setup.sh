#! /bin/bash

# For setting up netdata registery
# yum install -y autoconf automake curl gcc git libmnl-devel libuuid-devel lm_sensors make MySQL-python nc pkgconfig python python-psycopg2 PyYAML zlib-devel
# git clone https://github.com/netdata/netdata.git /root/netdata
# su - c "/root/netdata/netdata-installer.sh --dont-wait"
# ln -f -s /vagrant/netdata/netdata-master.conf /etc/netdata/netdata.conf
# systemctl restart netdata.service

# Grafana
yum install -y https://dl.grafana.com/oss/release/grafana-5.4.2-1.x86_64.rpm
systemctl enable grafana-server.service
systemctl start grafana-server.service

# promethius
mkdir /opt/prometheus
wget https://github.com/prometheus/prometheus/releases/download/v2.8.1/prometheus-2.8.1.linux-amd64.tar.gz
tar -xvf ./prometheus*.tar.gz -C /opt/prometheus/ --strip-components 1
ln -f -s /vagrant/netdata/prometheus/prometheus.yml /opt/prometheus/prometheus.yml
