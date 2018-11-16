#!/bin/sh
echo ========================================INSTALLING NFS CLIENT=============================================
sudo apt-get update
sudo apt-get install rpcbind nfs-common -y
echo ========================================INSTALLING SALTSTACK=============================================
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list
sudo apt-get update
sudo apt-get install salt-master salt-minion -y
echo ========================================CONFIGURING SALTSTACK============================================
mkdir -p /srv/salt
mkdir -p /srv/pillar
cp -R sls/* /srv/salt
cp -R yaml/* /srv/salt
sed -i '/#file_roots:/s/^#//' /etc/salt/master
sed -i '/#pillar_roots:/s/^#//' /etc/salt/master
sed -i '/#[[:space:]][[:space:]]base:/s/^#//' /etc/salt/master
sed -i '/#[[:space:]][[:space:]][[:space:]][[:space:]]-[[:space:]]\/srv\/salt/s/^#//' /etc/salt/master
sed -i '/#[[:space:]][[:space:]][[:space:]][[:space:]]-[[:space:]]\/srv\/pillar/s/^#//' /etc/salt/master
sed -i '/#auto_accept:/ a auto_accept: True' /etc/salt/master
service salt-master restart
sed -i '/#master:/ a master: 127.0.0.1' /etc/salt/minion
service salt-minion restart