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