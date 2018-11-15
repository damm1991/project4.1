/srv/token:
  file.directory:
   - user: master
   - mode: 777
   - makedirs: True

init_kubernetes:
  cmd.run:
    - name: kubeadm init --pod-network-cidr=10.244.0.0/16 >> /srv/token/join_token.txt

/home/master/.kube:
  file.directory:
    - makedirs: True

copy_file:
  file.copy:
    - name: /home/master/.kube/config
    - source: /etc/kubernetes/admin.conf
    - user: master
    - group: master

install_flannel:
  cmd.run:
    - name: kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/master/Documentation/kube-flannel.yml
