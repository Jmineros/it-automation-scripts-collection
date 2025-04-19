CopyEdit
# Log Rotation Script for Windows

$LogDir = "C:\Logs\MyApp"
$ArchiveDir = "C:\Logs\MyApp\Archive"
$LogFile = "C:\Logs\MyApp\rotation_log.txt"
$DaysToArchive = 7
$DaysToDelete = 30

New-Item -Path $ArchiveDir -ItemType Directory -Force | Out-Null
Add-Content $LogFile "`n==== Log Rotation: $(Get-Date) ===="

# Archive old logs
Get-ChildItem $LogDir -Filter *.log | Where-Object {
$_.LastWriteTime -lt (Get-Date).AddDays(-$DaysToArchive)
} | ForEach-Object {
$dest = Join-Path $ArchiveDir "$($_.BaseName).zip"
Compress-Archive -Path $_.FullName -DestinationPath $dest -Force
Remove-Item $_.FullName
Add-Content $LogFile "Archived $_.Name"
}

# Delete very old archives
Get-ChildItem $ArchiveDir -Filter *.zip | Where-Object {
$_.LastWriteTime -lt (Get-Date).AddDays(-$DaysToDelete)
} | Remove-Item -Force -Verbose

Add-Content $LogFile "Log rotation completed."