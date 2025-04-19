CopyEdit
$events = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625} -MaxEvents 50
$ips = $events | Where-Object { $_.Message -like "*RDP*" } |
ForEach-Object { ($_ -match "Source Network Address:\s+(\d+\.\d+\.\d+\.\d+)") *; $matches[1] } |
Group-Object | Where-Object { $_.Count -gt 5 } | Select-Object -ExpandProperty Name

foreach ($ip in $ips) {
New-NetFirewallRule -DisplayName "Block $ip" -Direction Inbound -RemoteAddress $ip -Action Block
Write-Host "🚫 Blocked suspicious IP: $ip"
}