CopyEdit
import socket

target = input("Enter target IP: ")
ports = [21, 22, 23, 80, 443, 3389]

for port in ports:
sock = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
sock.settimeout(0.5)
result = sock.connect_ex((target, port))
if result == 0:
print(f"✅ Port {port} is OPEN")
else:
print(f"❌ Port {port} is closed")
sock.close()
