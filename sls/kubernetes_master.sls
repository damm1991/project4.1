/srv/token:
  file.directory:
   - user: master
   - mode: 777
   - makedirs: True

init_kubernetes:
  cmd.run:
    - name: kubeadm init --pod-network-cidr=10.244.0.0/16 | grep 'kubeadm join' > /srv/salt/join_token.txt

/home/master/.kube:
  file.directory:
    - makedirs: True

copy_file:
  file.copy:
    - name: /home/master/.kube/config
    - source: /etc/kubernetes/admin.conf
    - user: master
    - group: master

install_kube_flannel:
  cmd.run:
    - name: sudo -H -u master kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml

install_kube_flannel_k8:
  cmd.run:
    - name: sudo -H -u master kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/k8s-manifests/kube-flannel-rbac.yml