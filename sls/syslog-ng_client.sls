copy_syslog-ng-conf-client:
  file.managed:
    - name: /etc/syslog-ng/syslog-ng.conf
    - source: salt://syslog-ng_client/syslog-ng.conf
    - replace: True

syslog-ng_client_restart:
  cmd.run:
    - name: service syslog-ng restart