#! /bin/bash

echo "Jenkins setup"

yum install -y java-1.8.0-openjdk-devel

curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install -y jenkins

systemctl enable jenkins.service
systemctl start jenkins.service

yum install -y git

sleep 5

echo "JENKINS PASSWORD: admin:`cat /var/lib/jenkins/secrets/initialAdminPassword`"

exit $?

# Add to options in: /etc/sysconfig/jenkins
#-Dhudson.model.ParametersAction.keepUndefinedParameters=true
