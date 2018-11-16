copy_join_token:
  file.managed:
    - name: /srv/join_token.txt
    - source: salt://join_token.txt

chmod_join_token:
  cmd.run:
    - name: chmod +x /srv/join_token.txt

install_token:
  cmd.run:
    - name: /srv/join_token.txt
