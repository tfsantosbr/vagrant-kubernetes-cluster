# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.box = "centos/7"

  config.vm.provider :virtualbox do |vb|
    vb.memory = 2048
    vb.cpus = 2
    config.vm.boot_timeout = 600
  end

  config.vm.define "kube-01" do |kube|
    kube.vm.hostname = "kube-01"
    kube.vm.network "private_network", ip: "192.168.56.101"
  end
 
 config.vm.define "kube-02" do |kube|
    kube.vm.hostname = "kube-02"
    kube.vm.network "private_network", ip: "192.168.56.102"
  end

 config.vm.define "kube-03" do |kube|
    kube.vm.hostname = "kube-03"
    kube.vm.network "private_network", ip: "192.168.56.103"
  end

end
