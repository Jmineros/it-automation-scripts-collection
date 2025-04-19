CopyEdit
$rules = Get-NetFirewallRule | Select DisplayName, Direction, Action, Enabled
$rules | Export-Csv -Path "C:\Logs\firewall_rules.csv" -NoTypeInformation
Write-Host "🛡️ Exported firewall rules to firewall_rules.csv"
