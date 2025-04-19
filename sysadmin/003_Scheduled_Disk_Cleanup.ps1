CopyEdit
# PowerShell - Disk Cleanup Script
$logFile = "C:\CleanupLogs\disk_cleanup_$(Get-Date -Format 'yyyy-MM-dd_HH-mm-ss').log"
$TotalFreed = 0

function Cleanup-Folder($path, $daysOld) {
if (Test-Path $path) {
$before = (Get-ChildItem $path -Recurse -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum
Get-ChildItem $path -Recurse -Force -ErrorAction SilentlyContinue | Where-Object {
!$_.PSIsContainer -and $_.LastWriteTime -lt (Get-Date).AddDays(-$daysOld)
} | Remove-Item -Force -ErrorAction SilentlyContinue
$after = (Get-ChildItem $path -Recurse -ErrorAction SilentlyContinue | Measure-Object Length -Sum).Sum
$freed = ($before - $after) / 1MB
$GLOBALS:TotalFreed += $freed
Add-Content $logFile "[$path] Freed $([math]::Round($freed, 2)) MB"
}
}

# Create log directory if needed
New-Item -Path "C:\CleanupLogs" -ItemType Directory -Force | Out-Null

# Run cleanups
Cleanup-Folder "$env:TEMP" 7
Cleanup-Folder "C:\Windows\Temp" 7
Cleanup-Folder "$env:USERPROFILE\AppData\Local\Microsoft\Windows\INetCache" 7
Cleanup-Folder "$env:USERPROFILE\AppData\Local\Google\Chrome\User Data\Default\Cache" 7
Cleanup-Folder "$env:SystemDrive\$Recycle.Bin" 0
Cleanup-Folder "C:\Windows\SoftwareDistribution\Download" 14

Add-Content $logFile "TOTAL FREED: $([math]::Round($TotalFreed, 2)) MB"
Write-Output "✅ Disk cleanup completed. Total freed: $([math]::Round($TotalFreed, 2)) MB"