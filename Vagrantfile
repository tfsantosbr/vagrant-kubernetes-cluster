# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "hashicorp/bionic64"
  config.vm.synced_folder ".", "/vagrant", disabled: true
  config.vm.provision "shell", path: "scripts/install.sh"

  config.vm.provider "hyperv" do |h|
    h.memory = 2048
    h.cpus = 2
  end
  
  config.vm.define "kube-01" do |kube|
    kube.vm.hostname = "kube-01"
  end
 
 config.vm.define "kube-02" do |kube|
    kube.vm.hostname = "kube-02"
  end

 config.vm.define "kube-03" do |kube|
    kube.vm.hostname = "kube-03"
  end

end
