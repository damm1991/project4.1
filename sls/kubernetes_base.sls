kubernetes_repository:
  pkgrepo.managed:
    - humanname: deb-kubernetes
    - name: deb http://apt.kubernetes.io/ kubernetes-xenial main
    - file: /etc/apt/sources.list.d/kubernetes.list
    - key_url: https://packages.cloud.google.com/apt/doc/apt-key.gpg

install_kubernetes:
  pkg.installed:
    - pkgs:
      - kubelet
      - kubeadm
      - kubectl
      - kubernetes-cni
    - require:
      - pkgrepo: kubernetes_repository

diable_swap:
  cmd.run:
    - name: swapoff -a
