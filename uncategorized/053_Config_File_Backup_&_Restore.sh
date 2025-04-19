CopyEdit
#!/bin/bash
CONFIG="/etc/nginx/nginx.conf"
BACKUP_DIR="/var/backups/nginx"
TIMESTAMP=$(date +%F_%T)

mkdir -p "$BACKUP_DIR"
cp "$CONFIG" "$BACKUP_DIR/nginx.conf.$TIMESTAMP"
echo "✅ Backup complete: nginx.conf.$TIMESTAMP"
Add restore logic with a --restore flag.
