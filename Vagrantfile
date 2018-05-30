# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  config.vm.box = "centos/7"
  config.vm.synced_folder "files/"

  config.vm.define :rebuildatron do |m|
    m.vm.hostname = "rebuildatron"
    m.vm.provision "shell", path: "./scripts/setup.sh"
    m.vm.network "private_network", ip: "192.168.50.2"
    m.vm.network "public_network", bridge: "internal"
  end

end

