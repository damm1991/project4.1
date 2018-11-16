#!/bin/sh
echo ========================================INSTALLING NFS CLIENT============================================
sudo apt-get update
sudo apt-get install rpcbind nfs-common -y
echo ========================================INSTALLING SALTSTACK=============================================
wget -O - https://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest/SALTSTACK-GPG-KEY.pub | apt-key add -
echo "deb http://repo.saltstack.com/apt/ubuntu/16.04/amd64/latest xenial main" > /etc/apt/sources.list.d/saltstack.list
sudo apt-get update
sudo apt-get install salt-minion -y
echo ========================================CONFIGURING SALTSTACK============================================
sed -i '/#master:/ a master: 192.168.0.20' /etc/salt/minion
service salt-minion restart
echo DONE!