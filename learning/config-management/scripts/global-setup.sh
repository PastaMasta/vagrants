#! /bin/bash

setenforce 0
systemctl stop firewalld.service
systemctl disable firewalld.service

yum install -y vim
