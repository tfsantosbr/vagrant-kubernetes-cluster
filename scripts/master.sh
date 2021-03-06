#!/bin/bash

sudo kubeadm init --apiserver-advertise-address <IP>

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown -R $USER $HOME/.kube

# instalando o network
kubectl apply -f "https://cloud.weave.works/k8s/net?k8s-version=$(kubectl version | base64 | tr -d '\n')"

# kubeadm token create --print-join-command