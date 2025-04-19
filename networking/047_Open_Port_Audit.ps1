CopyEdit
netstat -an | Select-String "LISTENING" | Out-File "C:\Logs\open_ports.txt"
Write-Host "✅ Open ports exported to open_ports.txt"
🐧 Linux: Use ss -tuln or netstat -tuln
