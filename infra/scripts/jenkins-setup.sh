#! /bin/bash

echo "Jenkins setup"

yum install -y java-1.8.0-openjdk-devel

curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install -y jenkins

systemctl disable firewalld.service
systemctl stop firewalld.service

systemctl enable jenkins.service
systemctl start jenkins.service

echo "JENKINS PASSWORD: admin:`cat /var/lib/jenkins/secrets/initialAdminPassword`"

# Extra bits
yum install -y git ruby ruby-devel automake gcc
gem install rake rspec rubocop

