copy_syslog-ng-conf-master:
  file.managed:
    - name: /etc/syslog-ng/syslog-ng.conf
    - source: salt://syslog-ng_master/syslog-ng.conf
    - replace: True