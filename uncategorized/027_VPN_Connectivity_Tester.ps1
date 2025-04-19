CopyEdit
$vpn = "YourVPNConnectionName"
$internalSite = "intranet.company.com"

# Check VPN status
$vpnStatus = Get-VpnConnection -Name $vpn
if ($vpnStatus.ConnectionStatus -eq "Connected") {
Write-Host "🔒 VPN is connected."
try {
Test-Connection -ComputerName $internalSite -Count 2 -ErrorAction Stop
Write-Host "✅ Internal site reachable."
} catch {
Write-Host "❌ VPN connected, but internal site unreachable."
}
} else {
Write-Host "❌ VPN not connected."
}
