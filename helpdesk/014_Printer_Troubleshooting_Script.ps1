CopyEdit
# Restart Print Spooler and clear queue
Stop-Service -Name Spooler -Force
Remove-Item -Path "C:\Windows\System32\spool\PRINTERS\*" -Force
Start-Service -Name Spooler
Write-Host "🖨️ Print queue cleared and service restarted."
