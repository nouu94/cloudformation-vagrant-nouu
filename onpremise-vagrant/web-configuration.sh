#/bin/bash

sudo dnf -y update
sudo dnf -y install httpd
cp .htaccess /var/www/html/
cp wp-config.php /var/www/html/
sudo dnf -y install php php-fpm php-mysqli
wget https://wordpress.org/latest.tar.gz
tar -zxvf latest.tar.gz
sudo usermod -a -G apache vagrant
sudo cp -r wordpress/* /var/www/html/
sudo chown -R apache:apache /var/www
sudo chmod 2775 /var/www && find /var/www -type d -exec sudo chmod 2775 {} \;
find /var/www -type f -exec sudo chmod 0664 {} \;
sudo sed -i '156s/.*/         AllowOverride All/' /etc/httpd/conf/httpd.conf
sudo systemctl restart httpd && sudo systemctl enable httpd
sudo firewall-cmd --add-service=http --perm
sudo firewall-cmd --reload
#selinux 추가
sudo setsebool -P httpd_can_network_connect 1
sudo chcon -R -t httpd_sys_rw_content_t /var/www/html/
sudo systemctl restart httpd && sudo systemctl enable httpd
