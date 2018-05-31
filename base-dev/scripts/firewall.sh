#! /bin/bash -x

#systemctl stop firewalld
#systemctl disable firewalld

nmcli con modify "System eth0" connection.zone internal
nmcli con modify "System eth1" connection.zone internal
