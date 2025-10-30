#!/bin/bash

# Buka semua port TCP & UDP
for p in 2021 2023 2024 2026 2027 2028 2029 2030 2031 2032 2033 8081 8082 8083 8084 8085 8086 8087 8088 8089 8090 8091; do
  ufw allow $p/tcp
  ufw allow $p/udp
done

# Restart semua service yang ada
for s in wings srv priv priv2 priv3 priv4 priv5 prib prib2 prib3 prib4 prib5; do
  systemctl restart $s 2>/dev/null && echo "✅ Restarted $s" || echo "⚠️ Service $s tidak ditemukan"
done
