CopyEdit
#!/bin/bash
cd /var/www/myapp
git pull origin main
sudo systemctl restart myapp.service
echo "✅ App pulled and restarted."
Hook this to a webhook for automation.
