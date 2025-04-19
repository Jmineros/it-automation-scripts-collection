CopyEdit
$instance = "localhost\SQLEXPRESS"
$database = "MyAppDB"
$backupPath = "C:\SQLBackups\${database}_$(Get-Date -Format yyyyMMddHHmmss).bak"

Invoke-Sqlcmd -ServerInstance $instance -Query "
BACKUP DATABASE [$database]
TO DISK = N'$backupPath'
WITH INIT, STATS = 10
"
Write-Host "✅ Backup complete: $backupPath"
