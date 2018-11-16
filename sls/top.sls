base:
  '*':
    - docker
    - kubernetes_base
  'master':
    - kubernetes_master
  'client*':
    - kubernetes_client