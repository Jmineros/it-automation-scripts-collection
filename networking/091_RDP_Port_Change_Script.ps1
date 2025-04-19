CopyEdit
$newPort = 3391
Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Terminal Server\WinStations\RDP-Tcp" -Name "PortNumber" -Value $newPort

New-NetFirewallRule -DisplayName "RDP Custom Port" -Direction Inbound -LocalPort $newPort -Protocol TCP -Action Allow

Write-Host "🔐 RDP port changed to $newPort. Reboot required to take effect."
⚠️ Make sure you open the new port in firewalls before rebooting.
