create_secret:
  cmd.run:
    - name: sudo -H -u master kubectl create secret generic mysql-pass --from-literal=password=mysql

create_pv:
  cmd.run:
    - name: sudo -H -u master kubectl create -f /srv/salt/pv-wordpress-mysql.yaml

create_mysql_deployment:
  cmd.run:
    - name: sudo -H -u master kubectl create -f /srv/salt/mysql-deployment.yaml

create_wordpress_deployment:
  cmd.run:
    - name: sudo -H -u master kubectl create -f /srv/salt/wordpress-deployment.yaml
