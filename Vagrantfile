# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure('2') do |config|

  config.vm.box = "centos/7"
  config.vm.synced_folder "files/", "/vagrant"

  config.vm.define :rebuildatron do |m|
    m.vm.hostname = "rebuildatron"
    m.vm.provision "shell", path: "./scripts/setup.sh"
    m.vm.network "private_network", ip: "192.168.50.2"
    m.vm.network "public_network", bridge: "internal"

    # Create a DVD drive per iso
    # Also move first boot device to disk so we don't boot from them
    m.vm.provider "virtualbox" do |vb|
      vb.customize [
        "modifyvm", :id,
        "--boot1","disk"
      ]
      port = 0
      Dir.glob('./*.iso').each do |iso|
	vb.customize [
	  "storageattach", :id, "--storagectl", "IDE",
	  "--port", port, "--device", "1",
	  "--type", "dvddrive",
	  "--medium", File.realpath(iso)
	]
	port += 1
      end
    end

  end
end

