CopyEdit
$source = "$env:USERPROFILE\Documents"
$onedrive = "$env:OneDrive\Backup\Documents"

robocopy $source $onedrive /MIR /R:2 /W:2 /XD "Temp" "Cache"
Write-Host "☁️ OneDrive backup complete."
🔁 Run this daily via Task Scheduler
