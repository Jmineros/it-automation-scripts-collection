CopyEdit
import hashlib

def hash_file(path):
with open(path, 'rb') as f:
return hashlib.sha256(f.read()).hexdigest()

baseline_hash = "expectedhash123abc..."
current_hash = hash_file("C:\\important\\config.ini")

if current_hash == baseline_hash:
print("✅ File integrity OK")
else:
print("⚠️ File has been modified!")
