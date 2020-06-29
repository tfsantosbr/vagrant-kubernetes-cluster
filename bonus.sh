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
