#!/bin/bash
# sudo su
sudo dnf update -y

 # Mount disk
 sudo mkfs.ext4 -m 0 -E lazy_itable_init=0,lazy_journal_init=0,discard /dev/sdb
 sudo mkdir -p /mnt/disks/mount_data
 sudo mount -o discard,defaults /dev/sdb /mnt/disks/mount_data
 sudo chmod a+w /mnt/disks/mount_data
 sudo cp /etc/fstab /etc/fstab.backup
 
 # Add auto mount when startup
 sudo echo  UUID=`sudo blkid -s UUID -o value /dev/sdb`  /mnt/disks/mount_data ext4 discard,defaults,nofail 0 2 | sudo tee -a /etc/fstab

 # Install nginx
 cd /home/
 sudo dnf install nginx -y
 sudo systemctl start nginx
 sudo systemctl enable nginx
 sudo dnf install php php-mysqlnd php-dom php-simplexml php-xml php-xmlreader php-curl php-exif php-ftp php-gd php-iconv php-json php-mbstring php-posix php-sockets php-tokenizer php-common php-gmp php-intl php-zip unzip -y
 
 # Install and configure
 sudo dnf install wget -y
 sudo wget https://wordpress.org/latest.tar.gz
 sudo tar xvzf latest.tar.gz
 sudo mkdir -p /mnt/disks/mount_data/wp
 sudo mv wordpress /mnt/disks/mount_data/wp/wordpress
 cd /mnt/disks/mount_data/wp/wordpress
 sudo cp wp-config-sample.php wp-config.php
 
 # Change database access
 sudo sed -i "s/define( 'DB_NAME', 'database_name_here' );/define( 'DB_NAME', 'wordpressdb' );/g" /mnt/disks/mount_data/wp/wordpress/wp-config.php
 sudo sed -i "s/define( 'DB_USER', 'username_here' );/define( 'DB_USER', 'hoangtranv' );/g" /mnt/disks/mount_data/wp/wordpress/wp-config.php
 sudo sed -i "s/define( 'DB_PASSWORD', 'password_here' );/define( 'DB_PASSWORD', 'P@ssw0rd' );/g" /mnt/disks/mount_data/wp/wordpress/wp-config.php
 sudo sed -i "s/define( 'DB_HOST', 'localhost' );/define( 'DB_HOST', '192.168.2.13' );/g" /mnt/disks/mount_data/wp/wordpress/wp-config.php
 
 sudo chown -R $USER:$USER /mnt/disks/mount_data/wp/wordpress
 sudo chmod -R 777 /mnt/disks/mount_data/wp/wordpress

 sudo  echo "server {

server_name hoangtranv.id.vn;

root /mnt/disks/mount_data/wp/wordpress;

index index.html index.php;

access_log /var/log/nginx/access.log;
error_log /var/log/nginx/error.log;

location = /favicon.ico {
log_not_found off;
access_log off;
}

location = /robots.txt {
allow all;
log_not_found off;
access_log off;
}

location / {
try_files \$uri \$uri/ /index.php?\$args;
}

location ~ \.php$ {
try_files \$uri =404;
fastcgi_pass unix:/run/php-fpm/www.sock;
fastcgi_index index.php;
fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
include fastcgi_params;
}
location ~* \.(js|css|png|jpg|jpeg|gif|ico|svg)$ {
expires max;
log_not_found off;
}
}" > /etc/nginx/conf.d/wp.conf

sudo sed -i "s/user = apache;/user = nginx;/g" /etc/php-fpm.d/www.conf
sudo sed -i "s/group = apache;/group = nginx;/g" /etc/php-fpm.d/www.conf

sudo systemctl restart php-fpm
sudo systemctl restart nginx

# Set up firewall
sudo firewall-cmd --zone=public --permanent --add-port 80/tcp
sudo firewall-cmd --zone=public --permanent --add-port 443/tcp
sudo firewall-cmd --reload

sudo setsebool -P httpd_can_network_connect 1

sudo dnf install policycoreutils-python-utils -y

sudo semanage fcontext -a -t httpd_sys_rw_content_t "/mnt/disks/mount_data/wp/wordpress(/.*)?"
sudo restorecon -Rv /mnt/disks/mount_data/wp/wordpress

# Install SSL
sudo dnf install epel-release -y
sudo dnf install certbot python3-certbot-nginx -y
sudo certbot --nginx -d hoangtranv.id.vn