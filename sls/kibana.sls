kibana_repository:
  pkgrepo.managed:
    - humanname: deb-kibana
    - name: deb http://packages.elastic.co/kibana/4.5/debian stable main
    - file: /etc/apt/sources.list.d/kibana-4.5.list

kibana:
  pkg.installed:
    - require:
      - pkgrepo: kibana_repository
  service.running:
    - watch:
      - file: /etc/kibana/kibana.yml

edit_kibana_config:
  file.line:
    - name: /etc/kibana/kibana.yml
    - mode: ensure
    - after: 'server.host:'
    - content: 'server.host: 0.0.0.0'

syslog-ng_master_restart:
  cmd.run:
    - name: service syslog-ng restart