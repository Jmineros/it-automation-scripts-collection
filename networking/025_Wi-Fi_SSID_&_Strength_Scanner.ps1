CopyEdit
$wifiList = netsh wlan show networks mode=bssid
$wifiList | Out-File "C:\Logs\wifi_scan.txt"
Write-Host "📡 Nearby Wi-Fi SSIDs saved to wifi_scan.txt"
Optionally parse output to structured format with regex