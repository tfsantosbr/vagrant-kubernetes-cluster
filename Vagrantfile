# -*- mode: ruby -*-
# vi: set ft=ruby :

WorkersCount = 1

Vagrant.configure(2) do |config|

  config.vm.box = "hashicorp/bionic64"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provision "shell", path: "scripts/provision.sh"
  config.vm.provider "hyperv"
  config.vm.network "public_network"

  config.vm.provider "hyperv" do |h|
    h.memory = 2048
    h.cpus = 2
  end
  
  config.vm.define "kube-master" do |master|
    master.vm.hostname = "kube-master"
    master.vm.provision "shell", path: "scripts/master.sh"
  end
 
  (1..WorkersCount).each do |i|
    config.vm.define "kube-worker-#{i}" do |worker|
      worker.vm.hostname = "kube-worker-#{i}"
    end
  end

end
