#! /bin/bash
[[ -n ${DEBUG} ]] && set -x

echo "###################################"
echo "setup-nas.sh"
echo "###################################"

mkdir -p /data/repo
mkdir -p /data/virt/docker
