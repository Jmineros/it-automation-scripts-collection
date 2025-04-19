CopyEdit
# Software Inventory Script

$softwareList = Get-ItemProperty HKLM:\Software\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall\* |
Select-Object DisplayName, DisplayVersion, Publisher, InstallDate

$logPath = "C:\Logs\software_inventory_$(Get-Date -Format 'yyyyMMdd_HHmmss').csv"
$softwareList | Where-Object { $_.DisplayName } | Export-Csv -Path $logPath -NoTypeInformation

Write-Host "✅ Software inventory exported to $logPath"
🔁 Can be run remotely using Invoke-Command
🧠 Useful for software audits, licensing checks, or cleanup
