#! /bin/bash
[[ -n ${DEBUG} ]] && set -x

for node in swarm{0..2} ; do
  echo $node
  vagrant ssh "${node}" -c 'ip a | grep 10.0.0'
done
