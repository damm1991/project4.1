docker_repository:
  pkgrepo.managed:
    - humanname: deb-docker
    - name: deb https://download.docker.com/linux/ubuntu xenial stable
    - file: /etc/apt/sources.list.d/docker.list
    - key_url: https://download.docker.com/linux/ubuntu/gpg

docker-ce:
  pkg.installed:
    - require:
      - pkgrepo: docker_repository
    - version: 18.06.1~ce~3-0~ubuntu
