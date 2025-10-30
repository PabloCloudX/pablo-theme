#!/bin/bash

# =============================
#  SCRIPT AUTO BUAT 12 FILE CONFIG
# =============================

# Pastikan folder ada
mkdir -p /etc/wings /etc/priv /etc/priv2 /etc/priv3 /etc/priv4 \
         /etc/prib /etc/prib2 /etc/prib3 /etc/prib4 /etc/prib5

# =============================
# Tulis isi masing-masing file
# =============================

cat <<'EOF' > /etc/wings/config.yml
debug: false
app_name: PabloCloud
uuid: 82eda383-cf78-401b-8bcd-45f8fe543cd6
token_id: LOzpdqW3Ty6pC77k
token: CJJJCoadWerUIE0oiqLKv7aE4ZkMiQcG3xAnquiaAt7UZp2DpMpj0agx2yElV04j
api:
  host: 0.0.0.0
  port: 8081
  ssl:
    enabled: true
    cert: /etc/letsencrypt/live/nodecok.backend.biz.id/fullchain.pem
    key: /etc/letsencrypt/live/nodecok.backend.biz.id/privkey.pem
  disable_remote_download: false
  upload_limit: 200
  trusted_proxies: []
system:
  root_directory: /var/lib/pterodactyl
  log_directory: /var/log/pterodactyl
  data: /var/lib/srv/volumes
  archive_directory: /var/lib/pterodactyl/archives
  backup_directory: /var/lib/pterodactyl/backups
  tmp_directory: /tmp/pterodactyl
  username: pterodactyl
  timezone: Asia/Jakarta
  user:
    rootless:
      enabled: false
      container_uid: 0
      container_gid: 0
    uid: 998
    gid: 998
  disk_check_interval: 150
  activity_send_interval: 60
  activity_send_count: 100
  check_permissions_on_boot: true
  enable_log_rotate: true
  websocket_log_count: 150
  sftp:
    bind_address: 0.0.0.0
    bind_port: 2023
    read_only: false
  crash_detection:
    enabled: true
    detect_clean_exit_as_crash: true
    timeout: 60
  backups:
    write_limit: 0
    compression_level: best_speed
  transfers:
    download_limit: 0
  openat_mode: auto
docker:
  network:
    interface: 172.18.0.1
    dns:
    - 1.1.1.1
    - 1.0.0.1
    name: pterodactyl_nw
    ispn: false
    driver: ""
    network_mode: pterodactyl_nw
    is_internal: false
    enable_icc: true
    network_mtu: 1500
    interfaces:
      v4:
        subnet: 172.18.0.0/16
        gateway: 172.18.0.1
      v6:
        subnet: fdba:17c8:6c94::/64
        gateway: fdba:17c8:6c94::1011
  domainname: ""
  registries: {}
  tmpfs_size: 100
  container_pid_limit: 512
  installer_limits:
    memory: 1024
    cpu: 100
  overhead:
    override: false
    default_multiplier: 1.05
    multipliers: {}
  use_performant_inspect: true
  userns_mode: ""
  log_config:
    type: local
    config:
      compress: "false"
      max-file: "1"
      max-size: 5m
      mode: non-blocking
throttles:
  enabled: true
  lines: 2000
  line_reset_interval: 100
remote: https://galaxy.pablocloud.biz.id/
remote_query:
  timeout: 30
  boot_servers_per_page: 50
allowed_mounts: []
allowed_origins:
- https://galaxy.pablocloud.biz.id
allow_cors_private_network: false
ignore_panel_config_updates: false
EOF

cat <<'EOF' > /etc/priv/config.yml
debug: false
app_name: PabloCloud
uuid: 2d98d237-11c1-4399-90ee-17e1bcf85c3
token_id: vycS9Ym2uqV7Llmr
token: RYTMcPAR5Edyzr4rfL9n34e5dfxjtdHG8iWo9XDpQjlpRmxJmsrFq0hD91XWgZQz
api:
  host: 0.0.0.0
  port: 8082
  ssl:
    enabled: true
    cert: /etc/letsencrypt/live/nodecok.backend.biz.id/fullchain.pem
    key: /etc/letsencrypt/live/nodecok.backend.biz.id/privkey.pem
  disable_remote_download: false
  upload_limit: 200
  trusted_proxies: []
system:
  root_directory: /var/lib/pterodactyl
  log_directory: /var/log/pterodactyl
  data: /var/lib/priv/volumes
  archive_directory: /var/lib/pterodactyl/archives
  backup_directory: /var/lib/pterodactyl/backups
  tmp_directory: /tmp/pterodactyl
  username: pterodactyl
  timezone: Asia/Jakarta
  user:
    rootless:
      enabled: false
      container_uid: 0
      container_gid: 0
    uid: 998
    gid: 998
  disk_check_interval: 150
  activity_send_interval: 60
  activity_send_count: 100
  check_permissions_on_boot: true
  enable_log_rotate: true
  websocket_log_count: 150
  sftp:
    bind_address: 0.0.0.0
    bind_port: 2024
    read_only: false
  crash_detection:
    enabled: true
    detect_clean_exit_as_crash: true
    timeout: 60
  backups:
    write_limit: 0
    compression_level: best_speed
  transfers:
    download_limit: 0
  openat_mode: auto
docker:
  network:
    interface: 172.18.0.1
    dns:
    - 1.1.1.1
    - 1.0.0.1
    name: pterodactyl_nw
    ispn: false
    driver: ""
    network_mode: pterodactyl_nw
    is_internal: false
    enable_icc: true
    network_mtu: 1500
    interfaces:
      v4:
        subnet: 172.18.0.0/16
        gateway: 172.18.0.1
      v6:
        subnet: fdba:17c8:6c94::/64
        gateway: fdba:17c8:6c94::1011
  domainname: ""
  registries: {}
  tmpfs_size: 100
  container_pid_limit: 512
  installer_limits:
    memory: 1024
    cpu: 100
  overhead:
    override: false
    default_multiplier: 1.05
    multipliers: {}
  use_performant_inspect: true
  userns_mode: ""
  log_config:
    type: local
    config:
      compress: "false"
      max-file: "1"
      max-size: 5m
      mode: non-blocking
throttles:
  enabled: true
  lines: 2000
  line_reset_interval: 100
remote: https://pablocloud.biz.id/
remote_query:
  timeout: 30
  boot_servers_per_page: 50
allowed_mounts: []
allowed_origins:
- https://pablocloud.biz.id
allow_cors_private_network: false
ignore_panel_config_updates: false
EOF

cat <<'EOF' > /etc/priv2/config.yml
debug: false
app_name: PabloCloud
uuid: ea5a2e49-c599-45d0-b1fc-325cc888baf6
token_id: aSMtJJMTcRg20Cc4
token: VDidw8DpxGrs16RKZNOI69pXugbnzafYUviK6EG40f0Dd31lWTQxnuwHb5l5j895
api:
  host: 0.0.0.0
  port: 8083
  ssl:
    enabled: true
    cert: /etc/letsencrypt/live/nodecok.backend.biz.id/fullchain.pem
    key: /etc/letsencrypt/live/nodecok.backend.biz.id/privkey.pem
  disable_remote_download: false
  upload_limit: 200
  trusted_proxies: []
system:
  root_directory: /var/lib/pterodactyl
  log_directory: /var/log/pterodactyl
  data: /var/lib/priv2/volumes
  archive_directory: /var/lib/pterodactyl/archives
  backup_directory: /var/lib/pterodactyl/backups
  tmp_directory: /tmp/pterodactyl
  username: pterodactyl
  timezone: Asia/Jakarta
  user:
    rootless:
      enabled: false
      container_uid: 0
      container_gid: 0
    uid: 998
    gid: 998
  disk_check_interval: 150
  activity_send_interval: 60
  activity_send_count: 100
  check_permissions_on_boot: true
  enable_log_rotate: true
  websocket_log_count: 150
  sftp:
    bind_address: 0.0.0.0
    bind_port: 2026
    read_only: false
  crash_detection:
    enabled: true
    detect_clean_exit_as_crash: true
    timeout: 60
  backups:
    write_limit: 0
    compression_level: best_speed
  transfers:
    download_limit: 0
  openat_mode: auto
docker:
  network:
    interface: 172.18.0.1
    dns:
    - 1.1.1.1
    - 1.0.0.1
    name: pterodactyl_nw
    ispn: false
    driver: ""
    network_mode: pterodactyl_nw
    is_internal: false
    enable_icc: true
    network_mtu: 1500
    interfaces:
      v4:
        subnet: 172.18.0.0/16
        gateway: 172.18.0.1
      v6:
        subnet: fdba:17c8:6c94::/64
        gateway: fdba:17c8:6c94::1011
  domainname: ""
  registries: {}
  tmpfs_size: 100
  container_pid_limit: 512
  installer_limits:
    memory: 1024
    cpu: 100
  overhead:
    override: false
    default_multiplier: 1.05
    multipliers: {}
  use_performant_inspect: true
  userns_mode: ""
  log_config:
    type: local
    config:
      compress: "false"
      max-file: "1"
      max-size: 5m
      mode: non-blocking
throttles:
  enabled: true
  lines: 2000
  line_reset_interval: 100
remote: https://p.pablocloud.biz.id/
remote_query:
  timeout: 30
  boot_servers_per_page: 50
allowed_mounts: []
allowed_origins:
- https://p.pablocloud.biz.id
allow_cors_private_network: false
ignore_panel_config_updates: false
EOF

cat <<'EOF' > /etc/priv3/config.yml
debug: false
uuid: a56bbadb-39d4-4044-873a-005fbaaeffbe
token_id: ALJJ1Xo8MG3klGMu
token: yp9PSBQ3SkApQa24K6umoh7av0Ga3yp6n2KQxRuEdbfur2pKIKmAD9yZm9JXW76u
api:
  host: 0.0.0.0
  port: 8084
  ssl:
    enabled: true
    cert: /etc/letsencrypt/live/nodecok.backend.biz.id/fullchain.pem
    key: /etc/letsencrypt/live/nodecok.backend.biz.id/privkey.pem
  disable_remote_download: false
  upload_limit: 200
  trusted_proxies: []
system:
  root_directory: /var/lib/pterodactyl
  log_directory: /var/log/pterodactyl
  data: /var/lib/priv3/volumes
  archive_directory: /var/lib/pterodactyl/archives
  backup_directory: /var/lib/pterodactyl/backups
  tmp_directory: /tmp/pterodactyl
  username: pterodactyl
  timezone: Asia/Jakarta
  user:
    rootless:
      enabled: false
      container_uid: 0
      container_gid: 0
    uid: 998
    gid: 998
  disk_check_interval: 150
  activity_send_interval: 60
  activity_send_count: 100
  check_permissions_on_boot: true
  enable_log_rotate: true
  websocket_log_count: 150
  sftp:
    bind_address: 0.0.0.0
    bind_port: 2027
    read_only: false
  crash_detection:
    enabled: true
    detect_clean_exit_as_crash: true
    timeout: 60
  backups:
    write_limit: 0
    compression_level: best_speed
  transfers:
    download_limit: 0
  openat_mode: auto
docker:
  network:
    interface: 172.18.0.1
    dns:
    - 1.1.1.1
    - 1.0.0.1
    name: pterodactyl_nw
    ispn: false
    driver: ""
    network_mode: pterodactyl_nw
    is_internal: false
    enable_icc: true
    network_mtu: 1500
    interfaces:
      v4:
        subnet: 172.18.0.0/16
        gateway: 172.18.0.1
      v6:
        subnet: fdba:17c8:6c94::/64
        gateway: fdba:17c8:6c94::1011
  domainname: ""
  registries: {}
  tmpfs_size: 100
  container_pid_limit: 512
  installer_limits:
    memory: 1024
    cpu: 100
  overhead:
    override: false
    default_multiplier: 1.05
    multipliers: {}
  use_performant_inspect: true
  userns_mode: ""
  log_config:
    type: local
    config:
      compress: "false"
      max-file: "1"
      max-size: 5m
      mode: non-blocking
throttles:
  enabled: true
  lines: 2000
  line_reset_interval: 100
remote: https://p2.pablocloud.biz.id/
remote_query:
  timeout: 30
  boot_servers_per_page: 50
allowed_mounts: []
allowed_origins:
- https://p2.pablocloud.biz.id
allow_cors_private_network: false
ignore_panel_config_updates: false
EOF

cat <<'EOF' > /etc/priv4/config.yml
debug: false
uuid: 2741b3c8-860e-41f2-b2f0-be28b0a33af7
token_id: abYBZFFR5TGSZp1b
token: mKFF5mcDnmc4Zt8hG7w4cVtxTJrOLAaLgEWRqmYY6s4JGbqPzW3n70mzhmj3BDk2
api:
  host: 0.0.0.0
  port: 8085
  ssl:
    enabled: true
    cert: /etc/letsencrypt/live/nodecok.backend.biz.id/fullchain.pem
    key: /etc/letsencrypt/live/nodecok.backend.biz.id/privkey.pem
  disable_remote_download: false
  upload_limit: 200
  trusted_proxies: []
system:
  root_directory: /var/lib/pterodactyl
  log_directory: /var/log/pterodactyl
  data: /var/lib/priv4/volumes
  archive_directory: /var/lib/pterodactyl/archives
  backup_directory: /var/lib/pterodactyl/backups
  tmp_directory: /tmp/pterodactyl
  username: pterodactyl
  timezone: Asia/Jakarta
  user:
    rootless:
      enabled: false
      container_uid: 0
      container_gid: 0
    uid: 998
    gid: 998
  disk_check_interval: 150
  activity_send_interval: 60
  activity_send_count: 100
  check_permissions_on_boot: true
  enable_log_rotate: true
  websocket_log_count: 150
  sftp:
    bind_address: 0.0.0.0
    bind_port: 2028
    read_only: false
  crash_detection:
    enabled: true
    detect_clean_exit_as_crash: true
    timeout: 60
  backups:
    write_limit: 0
    compression_level: best_speed
  transfers:
    download_limit: 0
  openat_mode: auto
docker:
  network:
    interface: 172.18.0.1
    dns:
    - 1.1.1.1
    - 1.0.0.1
    name: pterodactyl_nw
    ispn: false
    driver: ""
    network_mode: pterodactyl_nw
    is_internal: false
    enable_icc: true
    network_mtu: 1500
    interfaces:
      v4:
        subnet: 172.18.0.0/16
        gateway: 172.18.0.1
      v6:
        subnet: fdba:17c8:6c94::/64
        gateway: fdba:17c8:6c94::1011
  domainname: ""
  registries: {}
  tmpfs_size: 100
  container_pid_limit: 512
  installer_limits:
    memory: 1024
    cpu: 100
  overhead:
    override: false
    default_multiplier: 1.05
    multipliers: {}
  use_performant_inspect: true
  userns_mode: ""
  log_config:
    type: local
    config:
      compress: "false"
      max-file: "1"
      max-size: 5m
      mode: non-blocking
throttles:
  enabled: true
  lines: 2000
  line_reset_interval: 100
remote: https://p3.pablocloud.biz.id/
remote_query:
  timeout: 30
  boot_servers_per_page: 50
allowed_mounts: []
allowed_origins:
- https://p3.pablocloud.biz.id
allow_cors_private_network: false
ignore_panel_config_updates: false
EOF

cat <<'EOF' > /etc/priv5/config.yml
debug: false
uuid: 0c520141-9db7-42e2-8d6b-0f66a13d9d2e
token_id: yfJTgMGcSVK9aKXD
token: Mwp6d2HDPYaXEeCf5zwY5uw3hosKkqKeswDBawVgtgTvXd4tViW0qXTo9tUBpjSE
api:
  host: 0.0.0.0
  port: 8090
  ssl:
    enabled: true
    cert: /etc/letsencrypt/live/nodecok.backend.biz.id/fullchain.pem
    key: /etc/letsencrypt/live/nodecok.backend.biz.id/privkey.pem
  disable_remote_download: false
  upload_limit: 200
  trusted_proxies: []
system:
  root_directory: /var/lib/pterodactyl
  log_directory: /var/log/pterodactyl
  data: /var/lib/priv5/volumes
  archive_directory: /var/lib/pterodactyl/archives
  backup_directory: /var/lib/pterodactyl/backups
  tmp_directory: /tmp/pterodactyl
  username: pterodactyl
  timezone: Asia/Jakarta
  user:
    rootless:
      enabled: false
      container_uid: 0
      container_gid: 0
    uid: 998
    gid: 998
  disk_check_interval: 150
  activity_send_interval: 60
  activity_send_count: 100
  check_permissions_on_boot: true
  enable_log_rotate: true
  websocket_log_count: 150
  sftp:
    bind_address: 0.0.0.0
    bind_port: 2032
    read_only: false
  crash_detection:
    enabled: true
    detect_clean_exit_as_crash: true
    timeout: 60
  backups:
    write_limit: 0
    compression_level: best_speed
  transfers:
    download_limit: 0
  openat_mode: auto
docker:
  network:
    interface: 172.18.0.1
    dns:
    - 1.1.1.1
    - 1.0.0.1
    name: pterodactyl_nw
    ispn: false
    driver: ""
    network_mode: pterodactyl_nw
    is_internal: false
    enable_icc: true
    network_mtu: 1500
    interfaces:
      v4:
        subnet: 172.18.0.0/16
        gateway: 172.18.0.1
      v6:
        subnet: fdba:17c8:6c94::/64
        gateway: fdba:17c8:6c94::1011
  domainname: ""
  registries: {}
  tmpfs_size: 100
  container_pid_limit: 512
  installer_limits:
    memory: 1024
    cpu: 100
  overhead:
    override: false
    default_multiplier: 1.05
    multipliers: {}
  use_performant_inspect: true
  userns_mode: ""
  log_config:
    type: local
    config:
      compress: "false"
      max-file: "1"
      max-size: 5m
      mode: non-blocking
throttles:
  enabled: true
  lines: 2000
  line_reset_interval: 100
remote: https://p4.pablocloud.biz.id/
remote_query:
  timeout: 30
  boot_servers_per_page: 50
allowed_mounts: []
allowed_origins:
- https://p4.pablocloud.biz.id
allow_cors_private_network: false
ignore_panel_config_updates: false
EOF

cat <<'EOF' > /etc/prib/config.yml
debug: false
uuid: 60f8c520-4882-4611-8f1f-a97d73c7def0
token_id: BqfvF45UAiMSYDNl
token: BxljTC56XMEpWswQlgWiwlIQWSJflEAxe2iOB0LZ6edQCQKbTAIUpsQrP9r8mFgg
api:
  host: 0.0.0.0
  port: 8086
  ssl:
    enabled: true
    cert: /etc/letsencrypt/live/nodecok.backend.biz.id/fullchain.pem
    key: /etc/letsencrypt/live/nodecok.backend.biz.id/privkey.pem
  disable_remote_download: false
  upload_limit: 200
  trusted_proxies: []
system:
  root_directory: /var/lib/pterodactyl
  log_directory: /var/log/pterodactyl
  data: /var/lib/prib/volumes
  archive_directory: /var/lib/pterodactyl/archives
  backup_directory: /var/lib/pterodactyl/backups
  tmp_directory: /tmp/pterodactyl
  username: pterodactyl
  timezone: Asia/Jakarta
  user:
    rootless:
      enabled: false
      container_uid: 0
      container_gid: 0
    uid: 998
    gid: 998
  disk_check_interval: 150
  activity_send_interval: 60
  activity_send_count: 100
  check_permissions_on_boot: true
  enable_log_rotate: true
  websocket_log_count: 150
  sftp:
    bind_address: 0.0.0.0
    bind_port: 2029
    read_only: false
  crash_detection:
    enabled: true
    detect_clean_exit_as_crash: true
    timeout: 60
  backups:
    write_limit: 0
    compression_level: best_speed
  transfers:
    download_limit: 0
  openat_mode: auto
docker:
  network:
    interface: 172.18.0.1
    dns:
    - 1.1.1.1
    - 1.0.0.1
    name: pterodactyl_nw
    ispn: false
    driver: ""
    network_mode: pterodactyl_nw
    is_internal: false
    enable_icc: true
    network_mtu: 1500
    interfaces:
      v4:
        subnet: 172.18.0.0/16
        gateway: 172.18.0.1
      v6:
        subnet: fdba:17c8:6c94::/64
        gateway: fdba:17c8:6c94::1011
  domainname: ""
  registries: {}
  tmpfs_size: 100
  container_pid_limit: 512
  installer_limits:
    memory: 1024
    cpu: 100
  overhead:
    override: false
    default_multiplier: 1.05
    multipliers: {}
  use_performant_inspect: true
  userns_mode: ""
  log_config:
    type: local
    config:
      compress: "false"
      max-file: "1"
      max-size: 5m
      mode: non-blocking
throttles:
  enabled: true
  lines: 2000
  line_reset_interval: 100
remote: https://bytecorexzyranode.pablocloud.biz.id/
remote_query:
  timeout: 30
  boot_servers_per_page: 50
allowed_mounts: []
allowed_origins:
- https://bytecorexzyranode.pablocloud.biz.id
allow_cors_private_network: false
ignore_panel_config_updates: false
EOF

cat <<'EOF' > /etc/prib2/config.yml
debug: false
uuid: e3247d7c-1000-4f2c-b4cf-6291b5bbe1f8
token_id: gnKLEFMP9U6h4kZM
token: NdyT9lH0BKUjh2A7l8KyRQF9ifdYeKJoLQgLUgQGAgZqgjNesoEyobdzLPc1rtOh
api:
  host: 0.0.0.0
  port: 8087
  ssl:
    enabled: true
    cert: /etc/letsencrypt/live/nodecok.backend.biz.id/fullchain.pem
    key: /etc/letsencrypt/live/nodecok.backend.biz.id/privkey.pem
  disable_remote_download: false
  upload_limit: 200
  trusted_proxies: []
system:
  root_directory: /var/lib/pterodactyl
  log_directory: /var/log/pterodactyl
  data: /var/lib/prib2/volumes
  archive_directory: /var/lib/pterodactyl/archives
  backup_directory: /var/lib/pterodactyl/backups
  tmp_directory: /tmp/pterodactyl
  username: pterodactyl
  timezone: Asia/Jakarta
  user:
    rootless:
      enabled: false
      container_uid: 0
      container_gid: 0
    uid: 998
    gid: 998
  disk_check_interval: 150
  activity_send_interval: 60
  activity_send_count: 100
  check_permissions_on_boot: true
  enable_log_rotate: true
  websocket_log_count: 150
  sftp:
    bind_address: 0.0.0.0
    bind_port: 2021
    read_only: false
  crash_detection:
    enabled: true
    detect_clean_exit_as_crash: true
    timeout: 60
  backups:
    write_limit: 0
    compression_level: best_speed
  transfers:
    download_limit: 0
  openat_mode: auto
docker:
  network:
    interface: 172.18.0.1
    dns:
    - 1.1.1.1
    - 1.0.0.1
    name: pterodactyl_nw
    ispn: false
    driver: ""
    network_mode: pterodactyl_nw
    is_internal: false
    enable_icc: true
    network_mtu: 1500
    interfaces:
      v4:
        subnet: 172.18.0.0/16
        gateway: 172.18.0.1
      v6:
        subnet: fdba:17c8:6c94::/64
        gateway: fdba:17c8:6c94::1011
  domainname: ""
  registries: {}
  tmpfs_size: 100
  container_pid_limit: 512
  installer_limits:
    memory: 1024
    cpu: 100
  overhead:
    override: false
    default_multiplier: 1.05
    multipliers: {}
  use_performant_inspect: true
  userns_mode: ""
  log_config:
    type: local
    config:
      compress: "false"
      max-file: "1"
      max-size: 5m
      mode: non-blocking
throttles:
  enabled: true
  lines: 2000
  line_reset_interval: 100
remote: https://dhstore.pablocloud.biz.id/
remote_query:
  timeout: 30
  boot_servers_per_page: 50
allowed_mounts: []
allowed_origins:
- https://dhstore.pablocloud.biz.id
allow_cors_private_network: false
ignore_panel_config_updates: false
EOF

cat <<'EOF' > /etc/prib3/config.yml
debug: false
uuid: 941e8fe5-082e-451b-bd60-e9728f16051a
token_id: AIxYtBsgIONsohtE
token: 6idUYLoAmet05NFQ3LlxX01uvuXUixUrHOnhJ6hcB9GPFH6Iq4nvc5wDZKSRMwnb
api:
  host: 0.0.0.0
  port: 8088
  ssl:
    enabled: true
    cert: /etc/letsencrypt/live/nodecok.backend.biz.id/fullchain.pem
    key: /etc/letsencrypt/live/nodecok.backend.biz.id/privkey.pem
  disable_remote_download: false
  upload_limit: 200
  trusted_proxies: []
system:
  root_directory: /var/lib/pterodactyl
  log_directory: /var/log/pterodactyl
  data: /var/lib/prib3/volumes
  archive_directory: /var/lib/pterodactyl/archives
  backup_directory: /var/lib/pterodactyl/backups
  tmp_directory: /tmp/pterodactyl
  username: pterodactyl
  timezone: Asia/Jakarta
  user:
    rootless:
      enabled: false
      container_uid: 0
      container_gid: 0
    uid: 998
    gid: 998
  disk_check_interval: 150
  activity_send_interval: 60
  activity_send_count: 100
  check_permissions_on_boot: true
  enable_log_rotate: true
  websocket_log_count: 150
  sftp:
    bind_address: 0.0.0.0
    bind_port: 2030
    read_only: false
  crash_detection:
    enabled: true
    detect_clean_exit_as_crash: true
    timeout: 60
  backups:
    write_limit: 0
    compression_level: best_speed
  transfers:
    download_limit: 0
  openat_mode: auto
docker:
  network:
    interface: 172.18.0.1
    dns:
    - 1.1.1.1
    - 1.0.0.1
    name: pterodactyl_nw
    ispn: false
    driver: ""
    network_mode: pterodactyl_nw
    is_internal: false
    enable_icc: true
    network_mtu: 1500
    interfaces:
      v4:
        subnet: 172.18.0.0/16
        gateway: 172.18.0.1
      v6:
        subnet: fdba:17c8:6c94::/64
        gateway: fdba:17c8:6c94::1011
  domainname: ""
  registries: {}
  tmpfs_size: 100
  container_pid_limit: 512
  installer_limits:
    memory: 1024
    cpu: 100
  overhead:
    override: false
    default_multiplier: 1.05
    multipliers: {}
  use_performant_inspect: true
  userns_mode: ""
  log_config:
    type: local
    config:
      compress: "false"
      max-file: "1"
      max-size: 5m
      mode: non-blocking
throttles:
  enabled: true
  lines: 2000
  line_reset_interval: 100
remote: https://zyranode.pablocloud.biz.id/
remote_query:
  timeout: 30
  boot_servers_per_page: 50
allowed_mounts: []
allowed_origins:
- https://zyranode.pablocloud.biz.id
allow_cors_private_network: false
ignore_panel_config_updates: false
EOF

cat <<'EOF' > /etc/prib4/config.yml
debug: false
uuid: 31271811-8227-4944-9bc6-624563f3adff
token_id: 28ks1rRH9WE0jbzh
token: zjccyYdGQpg7Y68mynTh9NN2K5KA4oMTHGMWXgVTZCCxfJ5aUreKebL7LqYVhYyE
api:
  host: 0.0.0.0
  port: 8089
  ssl:
    enabled: true
    cert: /etc/letsencrypt/live/nodecok.backend.biz.id/fullchain.pem
    key: /etc/letsencrypt/live/nodecok.backend.biz.id/privkey.pem
  disable_remote_download: false
  upload_limit: 200
  trusted_proxies: []
system:
  root_directory: /var/lib/pterodactyl
  log_directory: /var/log/pterodactyl
  data: /var/lib/prib4/volumes
  archive_directory: /var/lib/pterodactyl/archives
  backup_directory: /var/lib/pterodactyl/backups
  tmp_directory: /tmp/pterodactyl
  username: pterodactyl
  timezone: Asia/Jakarta
  user:
    rootless:
      enabled: false
      container_uid: 0
      container_gid: 0
    uid: 998
    gid: 998
  disk_check_interval: 150
  activity_send_interval: 60
  activity_send_count: 100
  check_permissions_on_boot: true
  enable_log_rotate: true
  websocket_log_count: 150
  sftp:
    bind_address: 0.0.0.0
    bind_port: 2031
    read_only: false
  crash_detection:
    enabled: true
    detect_clean_exit_as_crash: true
    timeout: 60
  backups:
    write_limit: 0
    compression_level: best_speed
  transfers:
    download_limit: 0
  openat_mode: auto
docker:
  network:
    interface: 172.18.0.1
    dns:
    - 1.1.1.1
    - 1.0.0.1
    name: pterodactyl_nw
    ispn: false
    driver: ""
    network_mode: pterodactyl_nw
    is_internal: false
    enable_icc: true
    network_mtu: 1500
    interfaces:
      v4:
        subnet: 172.18.0.0/16
        gateway: 172.18.0.1
      v6:
        subnet: fdba:17c8:6c94::/64
        gateway: fdba:17c8:6c94::1011
  domainname: ""
  registries: {}
  tmpfs_size: 100
  container_pid_limit: 512
  installer_limits:
    memory: 1024
    cpu: 100
  overhead:
    override: false
    default_multiplier: 1.05
    multipliers: {}
  use_performant_inspect: true
  userns_mode: ""
  log_config:
    type: local
    config:
      compress: "false"
      max-file: "1"
      max-size: 5m
      mode: non-blocking
throttles:
  enabled: true
  lines: 2000
  line_reset_interval: 100
remote: https://fpuyystore.pablocloud.biz.id/
remote_query:
  timeout: 30
  boot_servers_per_page: 50
allowed_mounts: []
allowed_origins:
- https://fpuyystore.pablocloud.biz.id
allow_cors_private_network: false
ignore_panel_config_updates: false
EOF

cat <<'EOF' > /etc/prib5/config.yml
debug: false
uuid: b08093a7-6f82-4088-9a67-3f6eb50b9812
token_id: paxbmF3mUpKM6CEJ
token: HvUCLWeedRDylU1XdTM2cMzLdX4p7sMP20GDJpqrzQrP8MRhUdawEvgl3lDEDRjs
api:
  host: 0.0.0.0
  port: 8091
  ssl:
    enabled: true
    cert: /etc/letsencrypt/live/nodecok.backend.biz.id/fullchain.pem
    key: /etc/letsencrypt/live/nodecok.backend.biz.id/privkey.pem
  disable_remote_download: false
  upload_limit: 200
  trusted_proxies: []
system:
  root_directory: /var/lib/pterodactyl
  log_directory: /var/log/pterodactyl
  data: /var/lib/prib5/volumes
  archive_directory: /var/lib/pterodactyl/archives
  backup_directory: /var/lib/pterodactyl/backups
  tmp_directory: /tmp/pterodactyl
  username: pterodactyl
  timezone: Asia/Jakarta
  user:
    rootless:
      enabled: false
      container_uid: 0
      container_gid: 0
    uid: 998
    gid: 998
  disk_check_interval: 150
  activity_send_interval: 60
  activity_send_count: 100
  check_permissions_on_boot: true
  enable_log_rotate: true
  websocket_log_count: 150
  sftp:
    bind_address: 0.0.0.0
    bind_port: 2033
    read_only: false
  crash_detection:
    enabled: true
    detect_clean_exit_as_crash: true
    timeout: 60
  backups:
    write_limit: 0
    compression_level: best_speed
  transfers:
    download_limit: 0
  openat_mode: auto
docker:
  network:
    interface: 172.18.0.1
    dns:
    - 1.1.1.1
    - 1.0.0.1
    name: pterodactyl_nw
    ispn: false
    driver: ""
    network_mode: pterodactyl_nw
    is_internal: false
    enable_icc: true
    network_mtu: 1500
    interfaces:
      v4:
        subnet: 172.18.0.0/16
        gateway: 172.18.0.1
      v6:
        subnet: fdba:17c8:6c94::/64
        gateway: fdba:17c8:6c94::1011
  domainname: ""
  registries: {}
  tmpfs_size: 100
  container_pid_limit: 512
  installer_limits:
    memory: 1024
    cpu: 100
  overhead:
    override: false
    default_multiplier: 1.05
    multipliers: {}
  use_performant_inspect: true
  userns_mode: ""
  log_config:
    type: local
    config:
      compress: "false"
      max-file: "1"
      max-size: 5m
      mode: non-blocking
throttles:
  enabled: true
  lines: 2000
  line_reset_interval: 100
remote: https://wstore.pablocloud.biz.id/
remote_query:
  timeout: 30
  boot_servers_per_page: 50
allowed_mounts: []
allowed_origins:
- https://wstore.pablocloud.biz.id
allow_cors_private_network: false
ignore_panel_config_updates: false
EOF

echo "✅ Semua file berhasil dibuat!"

ufw allow 2023,2024,2026,2027,2028,2029,2021,2030,2031,2032,2033,8081,8082,8083,8084,8085,8086,8087,8088,8089,8090,8091/udp && ufw allow 2023,2024,2026,2027,2028,2029,2021,2030,2031,2032,2033,8081,8082,8083,8084,8085,8086,8087,8088,8089,8090,8091/tcp && systemctl restart wings srv priv priv2 priv3 priv4 priv5 prib prib2 prib3 prib4 prib5

echo "✅ Semua server berhasil dijalankan!"
