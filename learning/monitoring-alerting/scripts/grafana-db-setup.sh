#! /bin/bash

yum install -y https://dl.grafana.com/oss/release/grafana-5.4.2-1.x86_64.rpm

systemctl enable grafana-server.service
systemctl start grafana-server.service
