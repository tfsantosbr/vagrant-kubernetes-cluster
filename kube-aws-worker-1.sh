sudo su

hostname kworker1
echo "kworker1" > /etc/hostname

bash

apt-get update

swapoff -a
sed -i '/swap/d' /etc/fstab

curl -fsSL  https://get.docker.com | bash
sudo usermod -aG docker vagrant

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubelet kubeadm kubectl
