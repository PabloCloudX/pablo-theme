#!/bin/bash

# Banner
echo "==============================================="
echo "              INSTALL DEPENSI NODEJS 20x       "
echo "==============================================="

# Install dependencies for Node.js 20x
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x nodistro main" | sudo tee /etc/apt/sources.list.d/nodesource.list
sudo apt-get update
sudo apt-get install -y nodejs

# Install Yarn
echo "==============================================="
echo "                  INSTALL YARN                 "
echo "==============================================="
npm i -g yarn
cd /var/www/pterodactyl
yarn

# Download latest Blueprint
echo "==============================================="
echo "        DOWNLOAD LATEST BLUEPRINT              "
echo "==============================================="
cd /var/www/pterodactyl
wget "$(curl -s https://api.github.com/repos/BlueprintFramework/framework/releases/latest | grep 'browser_download_url' | cut -d '"' -f 4)" -O release.zip
cd /var/www/pterodactyl
unzip -o release.zip

# Configuration
echo "==============================================="
echo "              CONFIGURATION                    "
echo "==============================================="
FOLDER="/var/www/pterodactyl"
WEBUSER="www-data"
USERSHELL="/bin/bash"
PERMISSIONS="www-data:www-data"

sed -i -E -e "s|WEBUSER=\"www-data\" #;|WEBUSER=\"$WEBUSER\" #;|g" \
          -e "s|USERSHELL=\"/bin/bash\" #;|USERSHELL=\"$USERSHELL\" #;|g" \
          -e "s|OWNERSHIP=\"www-data:www-data\" #;|OWNERSHIP=\"$PERMISSIONS\" #;|g" \
          $FOLDER/blueprint.sh

# Installing Blueprint Automatically
echo "==============================================="
echo "       INSTALLING BLUEPRINT AUTOMATIC          "
echo "==============================================="
chmod +x $FOLDER/blueprint.sh
bash $FOLDER/blueprint.sh
