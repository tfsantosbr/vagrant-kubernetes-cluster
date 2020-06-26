# Importante
# 1. Abrir todas as portas necessárias para os nós se comunicarem

sudo sudo

hostname <hostname>
echo "<hostname>" > /etc/hostname

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


# master

kubeadm init --apiserver-cert-extra-sans=<EC2 PUBLIC IP>
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"
