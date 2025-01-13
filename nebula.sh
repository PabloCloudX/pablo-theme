#!/bin/bash

# Blueprint Installer Script

set -e

echo "Prepare for liftoff. Let's set up Blueprint Framework!"

# Install Node.js v20 or later
echo "Installing Node.js v20..."
sudo apt-get install -y ca-certificates curl gnupg
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg

# Pastikan konfirmasi otomatis
if [ $? -eq 0 ]; then
  echo "GPG key successfully imported!"
else
  echo "Error importing GPG key. Retrying with confirmation..."
  echo "y" | curl -fsSL https://deb.nodesource.com/gpgkey/nodesource-repo.gpg.key | sudo gpg --dearmor -o /etc/apt/keyrings/nodesource.gpg
fi

echo "Adding NodeSource repository..."
echo "deb [signed-by=/etc/apt/keyrings/nodesource.gpg] https://deb.nodesource.com/node_20.x $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/nodesource.list

sudo apt-get update -y
sudo apt-get install -y nodejs

# Install Yarn globally
echo "Installing Yarn..."
npm i -g yarn

# Install additional dependencies
echo "Installing additional dependencies..."
sudo apt install -y zip unzip git curl wget

# Navigate to Pterodactyl directory and initialize dependencies
PANEL_PATH="/var/www/pterodactyl" # Update this path if needed
echo "Navigating to Pterodactyl directory and initializing dependencies..."
if [ -d "$PANEL_PATH" ]; then
  cd "$PANEL_PATH"
  yarn
else
  echo "Pterodactyl directory not found at $PANEL_PATH. Please check the path and re-run the script."
  exit 1
fi

# Download the latest Blueprint release
echo "Downloading the latest Blueprint release..."
wget "$(curl -s https://api.github.com/repos/BlueprintFramework/framework/releases/latest | grep 'browser_download_url' | cut -d '"' -f 4)" -O release.zip

# Unarchive release with overwrite confirmation
echo "Unarchiving the release..."
mv release.zip "$PANEL_PATH/release.zip"
cd "$PANEL_PATH"
unzip -o release.zip <<< "A" # Automatically choose 'A' for overwrite all

# Configure Blueprint
echo "Configuring Blueprint..."
FOLDER="/var/www/pterodactyl"
WEBUSER="www-data"
USERSHELL="/bin/bash"
PERMISSIONS="www-data:www-data"

sed -i -E \
  -e "s|WEBUSER=\"www-data\"|WEBUSER=\"$WEBUSER\"|g" \
  -e "s|USERSHELL=\"/bin/bash\"|USERSHELL=\"$USERSHELL\"|g" \
  -e "s|OWNERSHIP=\"www-data:www-data\"|OWNERSHIP=\"$PERMISSIONS\"|g" \
  "$FOLDER/blueprint.sh"

# Set execute permissions and run Blueprint
echo "Setting permissions and executing Blueprint..."
chmod +x "$FOLDER/blueprint.sh"
"$FOLDER/blueprint.sh"

echo "Blueprint setup complete. You're ready to go!"
