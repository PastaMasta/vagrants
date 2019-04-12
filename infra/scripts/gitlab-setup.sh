#! /bin/bash

yum install -y curl policycoreutils-python

curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ee/script.rpm.sh | bash
EXTERNAL_URL="https://gitlab.localdomain" yum install -y gitlab-ee

systemctl enable gitlab-runsvdir.service
systemctl start gitlab-runsvdir.service
