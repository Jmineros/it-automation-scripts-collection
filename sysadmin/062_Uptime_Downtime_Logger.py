CopyEdit
import time, requests
from datetime import datetime

target = "https://yourserver.com"
log_file = "uptime_log.txt"

while True:
try:
response = requests.get(target, timeout=5)
status = "UP" if response.status_code == 200 else "DOWN"
except:
status = "DOWN"

with open(log_file, "a") as f:
f.write(f"{datetime.now()} - {target} - {status}\n")

time.sleep(300)  # check every 5 minutes
