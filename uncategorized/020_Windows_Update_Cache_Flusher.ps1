CopyEdit
Stop-Service -Name wuauserv -Force
Remove-Item -Path "C:\Windows\SoftwareDistribution\*" -Recurse -Force
Start-Service -Name wuauserv
Write-Host "🧼 Windows Update cache cleared. Try updates again."