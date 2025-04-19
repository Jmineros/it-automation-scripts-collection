CopyEdit
# Backup all GPOs
$backupPath = "C:\GPO_Backups\$(Get-Date -Format yyyyMMdd_HHmmss)"
New-Item -ItemType Directory -Path $backupPath -Force | Out-Null
Backup-GPO -All -Path $backupPath
Write-Host "✅ GPOs backed up to $backupPath"

# Restore GPO (optional - uncomment when needed)
# Restore-GPO -Name "Default Domain Policy" -Path $backupPath -TargetName "Default Domain Policy"
💡 Automate nightly or before changes
🧠 Use GPO GUIDs for fine-grained restore
