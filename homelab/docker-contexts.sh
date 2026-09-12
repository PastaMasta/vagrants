#! /bin/bash
[[ -n ${DEBUG} ]] && set -x


docker context create node0 --docker "host=ssh://vagrant@node0.lab.localdomain"
docker context create node1 --docker "host=ssh://vagrant@node1.lab.localdomain"
docker context create node2 --docker "host=ssh://vagrant@node2.lab.localdomain"
