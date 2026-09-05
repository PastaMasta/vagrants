#! /bin/bash
[[ -n ${DEBUG} ]] && set -x

echo "###################################"
echo "setup-all.sh"
echo "###################################"

resolvconf -d eth0.inet
apt update
