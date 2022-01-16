# Write your provision script here
sudo apt-get update
sudo apt-get -y install nginx
cp /etc/nginx/nginx.conf /etc/nginx/nginx.conf.bkp
cp /tmp/synced/nginx.conf /etc/nginx/nginx.conf
mkdir /usr/share/provision-it
cp /tmp/synced/index.html /usr/share/provision-it/index.html
sudo nginx -s reload