
kubeadm init --apiserver-cert-extra-sans=<PUBLIC_IP>


# um dos dois no master
kubectl apply -f https://docs.projectcalico.org/manifests/calico.yaml

# workers

kubeadm join ....

# haproxy

frontend http_front
  bind *:80
  stats uri /haproxy?stats
  default_backend http_back

backend http_back
  balance roundrobin
  server kube <worker-node1-ip>:80
  server kube <worker-node2-ip>:80

# certs

rm /etc/kubernetes/pki/apiserver.*
kubeadm init phase certs all --apiserver-advertise-address=0.0.0.0 --apiserver-cert-extra-sans=<PUBLIC_IP>
docker rm -f `docker ps -q -f 'name=k8s_kube-apiserver*'`
systemctl restart kubelet