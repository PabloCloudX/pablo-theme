#!/bin/bash

# Memastikan script dijalankan sebagai root
if [ "$EUID" -ne 0 ]; then
  echo "Harap jalankan sebagai root."
  exit
fi

# Update dan instalasi awal
echo "Updating system and installing dependencies..."
apt update -y && apt upgrade -y
apt install -y curl wget sudo git unzip mysql-server nginx php php-cli php-fpm php-mysql \
php-curl php-mbstring php-xml composer nodejs software-properties-common certbot python3-certbot-nginx

# Meminta input pengguna
read -p "Masukkan domain panel: " PANEL_DOMAIN
read -p "Masukkan domain node: " NODE_DOMAIN

# Menginstal Composer
echo "Installing Composer..."
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

# Menginstal Pterodactyl Panel
echo "Installing Pterodactyl Panel..."
cd /var/www
curl -Lo panel.tar.gz https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz
mkdir -p /var/www/pterodactyl
tar -xzvf panel.tar.gz -C /var/www/pterodactyl --strip-components=1
cd /var/www/pterodactyl

# Konfigurasi Pterodactyl Panel
echo "Configuring Pterodactyl Panel..."
cp .env.example .env
composer install --no-dev --optimize-autoloader
php artisan key:generate --force
php artisan p:environment:setup --author-email admin@"$PANEL_DOMAIN" \
    --url https://"$PANEL_DOMAIN" --timezone Asia/Jakarta --cache-driver redis \
    --session-driver redis --queue-driver redis
php artisan p:environment:database --host 127.0.0.1 --port 3306 --database panel \
    --username root --password ""
php artisan migrate --force

# Mengatur izin folder
chown -R www-data:www-data /var/www/pterodactyl
chmod -R 755 /var/www/pterodactyl

# Menginstal Wings
echo "Installing Wings..."
curl -sSL https://get.docker.com/ | CHANNEL=stable bash
systemctl enable --now docker
npm install -g pm2

mkdir -p /srv/daemon /srv/daemon-data
cd /srv/daemon
curl -Lo wings https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64
chmod +x wings

# Informasi konfigurasi manual Wings
echo "Wings telah diunduh ke /srv/daemon. Silakan konfigurasikan secara manual."

# Menginstal phpMyAdmin
echo "Installing phpMyAdmin..."
cd /usr/share
curl -Lo phpmyadmin.zip https://www.phpmyadmin.net/downloads/phpMyAdmin-latest-all-languages.zip
unzip phpmyadmin.zip
mv phpMyAdmin-*-all-languages phpmyadmin
rm phpmyadmin.zip

# Konfigurasi phpMyAdmin
echo "Configuring phpMyAdmin..."
mkdir -p /usr/share/phpmyadmin/tmp
chmod 777 /usr/share/phpmyadmin/tmp
cp /usr/share/phpmyadmin/config.sample.inc.php /usr/share/phpmyadmin/config.inc.php
sed -i "s|\['AllowNoPassword'\] = false;|\['AllowNoPassword'\] = false;|" /usr/share/phpmyadmin/config.inc.php

# Mengunduh tema Darkwolf
echo "Installing Darkwolf theme for phpMyAdmin..."
mkdir -p /usr/share/phpmyadmin/themes
cd /usr/share/phpmyadmin/themes
curl -Lo darkwolf.zip https://files.phpmyadmin.net/themes/darkwolf/2.0/darkwolf-2.0.zip
unzip darkwolf.zip
rm darkwolf.zip

# Konfigurasi Nginx untuk Panel, Node, dan phpMyAdmin
echo "Configuring Nginx..."
cat > /etc/nginx/sites-available/panel <<EOF
server {
    listen 80;
    server_name $PANEL_DOMAIN;

    location / {
        return 301 https://\$host\$request_uri;
    }
}

server {
    listen 443 ssl http2;
    server_name $PANEL_DOMAIN;

    ssl_certificate /etc/letsencrypt/live/$PANEL_DOMAIN/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$PANEL_DOMAIN/privkey.pem;

    root /var/www/pterodactyl/public;
    index index.php index.html;

    location / {
        try_files \$uri \$uri/ /index.php?\$query_string;
    }

    location ~ \.php\$ {
        include snippets/fastcgi-php.conf;
        fastcgi_pass unix:/var/run/php/php-fpm.sock;
        fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        include fastcgi_params;
    }

    location ~ /\.ht {
        deny all;
    }

    location /pma {
        alias /usr/share/phpmyadmin/;
        index index.php;

        location ~ ^/pma/(.+\.php)\$ {
            try_files \$uri =404;
            include snippets/fastcgi-php.conf;
            fastcgi_pass unix:/var/run/php/php-fpm.sock;
            fastcgi_param SCRIPT_FILENAME \$document_root\$fastcgi_script_name;
        }

        location ~* ^/pma/(.+\.(jpg|jpeg|gif|css|png|js|ico|html|xml|txt))\$ {
            try_files \$uri =404;
        }
    }
}
EOF

cat > /etc/nginx/sites-available/node <<EOF
server {
    listen 80;
    server_name $NODE_DOMAIN;

    location / {
        return 301 https://\$host\$request_uri;
    }
}

server {
    listen 443 ssl http2;
    server_name $NODE_DOMAIN;

    ssl_certificate /etc/letsencrypt/live/$NODE_DOMAIN/fullchain.pem;
    ssl_certificate_key /etc/letsencrypt/live/$NODE_DOMAIN/privkey.pem;

    root /srv/daemon;
}
EOF

ln -s /etc/nginx/sites-available/panel /etc/nginx/sites-enabled/
ln -s /etc/nginx/sites-available/node /etc/nginx/sites-enabled/
nginx -t && systemctl reload nginx

# Memasang SSL menggunakan Certbot untuk Panel dan Node
echo "Installing SSL with Certbot for Panel and Node..."
certbot --nginx -d "$PANEL_DOMAIN" -d "$NODE_DOMAIN" --non-interactive --agree-tos -m admin@"$PANEL_DOMAIN"

# Finalisasi
echo "Installation complete!"
echo "Pterodactyl Panel tersedia di https://$PANEL_DOMAIN"
echo "Pterodactyl Node tersedia di https://$NODE_DOMAIN"
echo "phpMyAdmin tersedia di https://$PANEL_DOMAIN/pma"
