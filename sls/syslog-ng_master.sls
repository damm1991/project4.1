copy_syslog-ng-conf-master:
  file.managed:
    - name: /etc/syslog-ng/syslog-ng.conf
    - source: salt://syslog-ng_master/syslog-ng.conf
    - replace: True

add_java_syslog-ng:
  file.line:
    - name: /etc/systemd/system/multi-user.target.wants/syslog-ng.service
    - mode: ensure
    - after: Service
    - content: 'Environment=LD_LIBRARY_PATH=/usr/lib/jvm/java-8-openjdk-amd64/jre/lib/amd64/server/'

syslog-ng:
  service.running:
    - watch:
      - file: /etc/syslog-ng/syslog-ng.conf