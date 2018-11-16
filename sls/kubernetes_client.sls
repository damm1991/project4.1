include:
  - kubernetes_master

copy_join_token:
  file.managed:
    - name: /srv/join_token.txt
    - source: salt://join_token.txt
    - require:
      - sls: kubernetes_master

chmod_join_token:
  cmd.run:
    - name: chmod +x /srv/join_token.txt
    - require:
      - copy_join_token

install_token:
  cmd.run:
    - name: /srv/join_token.txt
    - require:
      - chmod_join_token