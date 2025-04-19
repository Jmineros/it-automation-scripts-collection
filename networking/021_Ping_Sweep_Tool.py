CopyEdit
import os
import platform
import subprocess

network = "192.168.1."
live_hosts = []

for i in range(1, 255):
ip = f"{network}{i}"
if platform.system().lower() == "windows":
result = subprocess.run(["ping", "-n", "1", "-w", "200", ip], capture_output=True)
else:
result = subprocess.run(["ping", "-c", "1", "-W", "1", ip], capture_output=True)

if "ttl=" in result.stdout.decode().lower():
live_hosts.append(ip)
print(f"✅ {ip} is alive")

print(f"Total live hosts: {len(live_hosts)}")
