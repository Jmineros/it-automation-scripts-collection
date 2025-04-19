CopyEdit
#!/bin/bash
docker system prune -af
docker volume prune -f
echo "🧹 Docker system cleaned up!"
Add this to a cron job for automated weekly cleanups.