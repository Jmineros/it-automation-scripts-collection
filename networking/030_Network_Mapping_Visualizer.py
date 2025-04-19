CopyEdit
import socket, os

subnet = "192.168.1."
ports = [22, 80, 443]

for i in range(1, 10):  # limit for demo
ip = f"{subnet}{i}"
print(f"{ip}: ", end="")
for port in ports:
s = socket.socket()
s.settimeout(0.3)
result = s.connect_ex((ip, port))
if result == 0:
print(f"{port}", end=" ")
s.close()
print()
📍 Extend with networkx + matplotlib for actual diagrams