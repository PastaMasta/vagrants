#! /bin/bash -x

./clear-chef.sh $*
vagrant destroy -f $*
vagrant up $*
