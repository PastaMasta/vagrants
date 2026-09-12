#! /bin/bash
[[ -n ${DEBUG} ]] && set -x

nodes=$(vagrant status --machine-readable | awk -F, '/,state,/{print $2}')
for node in ${nodes} ; do
  vagrant ssh -c 'echo $(hostname -f ; ip -o a s eth1 | awk "{print $4}"|sed -e "s/\/.*$//g")' ${node}
done
