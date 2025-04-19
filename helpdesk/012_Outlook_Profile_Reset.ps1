CopyEdit
# Reset Outlook profile for current user
$regPath = "HKCU:\Software\Microsoft\Office\16.0\Outlook\Profiles"
$backupPath = "$regPath-Backup-$(Get-Date -Format yyyyMMddHHmmss)"

Rename-Item -Path $regPath -NewName $backupPath -Force
Write-Host "🛠️ Outlook profile reset. A new one will be created on next launch."
