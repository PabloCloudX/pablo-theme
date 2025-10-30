#!/bin/bash

# Menanyakan nama service Wings
read -p "Masukkan nama service untuk Wings (misalnya 'pterodactyl' atau 'srv'): " service_name

# Menanyakan lokasi path untuk konfigurasi Wings
read -p "Masukkan nama folder konfigurasi Wings (contoh: pterodactyl): " config_name
config_path="/etc/$config_name"

echo "Path konfigurasi Wings: $config_path"
# Menentukan lokasi direktori untuk Wings dan file executable
bin_path="/usr/local/bin"
pid_path="/var/run/$service_name"

# Membuat direktori yang diperlukan jika belum ada
echo "Membuat direktori di $bin_path dan $pid_path..."
sudo mkdir -p $bin_path
sudo mkdir -p $pid_path
sudo mkdir -p $config_path

# Mengunduh Wings dan menempatkannya di lokasi yang ditentukan dengan nama service
echo "Mengunduh Wings ke $bin_path/$service_name..."
curl -L -o $bin_path/$service_name "https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_$([[ "$(uname -m)" == "x86_64" ]] && echo "amd64" || echo "arm64")"
sudo chmod u+x $bin_path/$service_name

# Menyediakan file service systemd
echo "Membuat file service untuk Wings di /etc/systemd/system/$service_name.service..."
cat <<EOF | sudo tee /etc/systemd/system/$service_name.service
[Unit]
Description=Pterodactyl Wings Daemon
After=docker.service
Requires=docker.service
PartOf=docker.service

[Service]
User=root
WorkingDirectory=$config_path
LimitNOFILE=4096
PIDFile=$pid_path/daemon.pid
ExecStart=$bin_path/$service_name --config $config_path/config.yml
Restart=on-failure
StartLimitInterval=180
StartLimitBurst=30
RestartSec=5s

[Install]
WantedBy=multi-user.target
EOF

# Reload systemd dan mulai Wings
echo "Menjalankan systemctl untuk reload dan memulai service Wings..."
sudo systemctl daemon-reload
sudo systemctl enable --now $service_name

# Menampilkan status Wings
echo "Memeriksa status Wings..."
sudo systemctl status $service_name 
