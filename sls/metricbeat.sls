metricbeat_repository:
  pkgrepo.managed:
    - humanname: deb-metricbeat
    - name: deb https://artifacts.elastic.co/packages/6.x/apt stable main
    - file: /etc/apt/sources.list.d/metricbeat.list
    - key_url: https://artifacts.elastic.co/GPG-KEY-elasticsearch

metricbeat:
  pkg.installed:
    - require:
      - pkgrepo: metricbeat_repository
  service.running:
    - watch:
      - file: /etc/metricbeat/metricbeat.yml

set_metricbeat_host:
  file.line:
    - name: /etc/metricbeat/metricbeat.yml
    - match: 'hosts: ["localhost:9200"]'
    - mode: replace
    - content: 'hosts: ["192.168.0.20:9200"]'
