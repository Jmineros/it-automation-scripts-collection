CopyEdit
import re, os, zipfile
from datetime import datetime

log_file = "app.log"
archive_file = f"archived_{datetime.now().strftime('%Y%m%d%H%M%S')}.zip"
output_file = "errors.txt"

with open(log_file, 'r') as f, open(output_file, 'w') as out:
for line in f:
if "ERROR" in line:
out.write(line)

with zipfile.ZipFile(archive_file, 'w') as zipf:
zipf.write(log_file)
os.remove(log_file)

print(f"✅ Parsed errors saved. Log archived as {archive_file}")
