# todos
sudo su

apt-get update

swapoff -a
sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab

curl -fsSL  https://get.docker.com | bash

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" > /etc/apt/sources.list.d/kubernetes.list
apt-get update
apt-get install -y kubelet kubeadm kubectl

# master
kubeadm init
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

# workers

kubeadm join 172.28.203.165:6443 --token ieeqaw.kzxjv71dxs7xhwcm \
    --discovery-token-ca-cert-hash sha256:0e62846a7a9b75ebc8b50cf8fd663eec58f7d3e38ca040d6ba7349063a3eb6eb