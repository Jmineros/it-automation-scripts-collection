CopyEdit
# Requires DHCP role on Windows Server
$leases = Get-DhcpServerv4Lease -ComputerName "dhcpserver01" -ScopeId 192.168.1.0
$leases | Select IPAddress, HostName, ClientId, LeaseExpiryTime | Export-Csv -Path "C:\Logs\dhcp_leases.csv" -NoTypeInformation

Write-Host "📋 DHCP lease info exported."
🧠 Linux: Use cat /var/lib/dhcp/dhcpd.leases
