syslog-ng_repository:
  pkgrepo.managed:
    - humanname: deb-syslog-ng
    - name: deb http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/xUbuntu_16.04 ./
    - file: /etc/apt/sources.list.d/syslog-ng.list
    - key_url: http://download.opensuse.org/repositories/home:/laszlo_budai:/syslog-ng/xUbuntu_16.04/Release.key

syslog-ng:
  pkg.installed:
    - require:
      - pkgrepo: syslog-ng_repository
  service.running:
    - watch:
      - file: /etc/syslog-ng/syslog-ng.conf