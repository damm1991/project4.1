elasticsearch_repository:
  pkgrepo.managed:
    - humanname: deb-elasticsearch
    - name: deb http://packages.elastic.co/elasticsearch/2.x/debian stable main
    - file: /etc/apt/sources.list.d/elasticsearch2.list
    - key_url: https://packages.elastic.co/GPG-KEY-elasticsearch

elasticsearch:
  pkg.installed:
    - require:
      - pkgrepo: elasticsearch_repository
  service.running:
    - watch:
      - file: /etc/elasticsearch/elasticsearch.yml

edit_elasticsearch_config_name:
  file.line:
    - name: /etc/elasticsearch/elasticsearch.yml
    - mode: ensure
    - after: 'cluster.name:'
    - content: 'cluster.name: syslog'

edit_elasticsearch_config_host:
  file.line:
    - name: /etc/elasticsearch/elasticsearch.yml
    - mode: ensure
    - after: 'network.host:'
    - content: 'network.host: 0.0.0.0'