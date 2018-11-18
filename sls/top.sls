base:
  '*':
    - docker
    - kubernetes_base
    - syslog-ng
    - metricbeats
  'master':
    - kubernetes_master
    - syslog-ng_master
    - elasticsearch
    - kibana
  'client*':
    - kubernetes_client
    - syslog-ng_client