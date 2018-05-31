#! /bin/bash -x

nodes="base master"
[[ $# -ge 1 ]] && nodes=$*

for i in ${nodes} ; do
  knife node delete $i -y
  knife client delete $i -y
done
