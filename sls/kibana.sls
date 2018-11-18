kibana_repository:
  pkgrepo.managed:
    - humanname: deb-kibana
    - name: deb http://packages.elastic.co/kibana/4.5/debian stable main
    - file: /etc/apt/sources.list.d/kibana-4.5.list

kibana:
  pkg.installed:
    - require:
      - pkgrepo: kibana_repository