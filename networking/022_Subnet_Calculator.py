CopyEdit
import ipaddress

cidr = input("Enter CIDR block (e.g., 192.168.1.0/24): ")
net = ipaddress.ip_network(cidr, strict=False)

print(f"Network: {net.network_address}")
print(f"Broadcast: {net.broadcast_address}")
print(f"Usable hosts: {net.num_addresses - 2}")
print(f"First Host: {list(net.hosts())[0]}")
print(f"Last Host: {list(net.hosts())[-1]}")
