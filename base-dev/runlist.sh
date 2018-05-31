#! /bin/bash -x

knife node run_list set base chef-base-dev chef-base-dev::kvm
knife node run_list set master chef-master-dev
