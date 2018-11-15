# project4.1

Pull: git clone https://github.com/damm1991/project4.1.git<br>
<h2>run script</h2><br>
chmod +x masterscript.sh<br>
sudo ./masterscript.sh<br>
chmod +x clientscript.sh<br>
sudo ./client.sh<br>
<h2>Salt</h2><br>
sudo salt-key --list all<br>
salt '*' state.apply <sls_name><br>
