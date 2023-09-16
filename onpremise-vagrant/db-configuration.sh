#/bin/bash

wget http://repo.mysql.com/mysql80-community-release-el9-4.noarch.rpm
wget https://dev.mysql.com/get/mysql80-community-release-el9-4.noarch.rpm
sudo rpm -ivh mysql80-community-release-el9-4.noarch.rpm
sudo yum install -y mysql-community-server.x86_64
sudo systemctl start mysqld
sudo sed -i '5s/.*/validate_password.policy=LOW/' /etc/my.cnf
sudo sed -i '6s/.*/default_password_lifetime=0/' /etc/my.cnf
sudo systemctl restart mysqld && sudo systemctl enable mysqld

sudo mysql -u root -p$(sudo grep 'temporary password' /var/log/mysqld.log | awk -F': ' '{print $NF}') --connect-expired-password <<-EOF 
  ALTER USER 'root'@'localhost' IDENTIFIED BY 'VeryHardR00tPW!';
  FLUSH PRIVILEGES;
EOF

sudo mysql -u root -pVeryHardR00tPW! <<-EOF 
  CREATE DATABASE wordpress;
  CREATE USER 'wordpress'@'%' IDENTIFIED BY 'codenative';
  GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';
  FLUSH PRIVILEGES;
EOF
# 방화벽 추가 추가
sudo firewall-cmd --add-port=3306/tcp --perm
sudo firewall-cmd --reload



 