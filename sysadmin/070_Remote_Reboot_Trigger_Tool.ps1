CopyEdit
$remotePC = "remote-host01"
Invoke-Command -ComputerName $remotePC -ScriptBlock { Restart-Computer -Force }
Write-Host "♻️ Reboot command sent to $remotePC"
Ensure WinRM is enabled + firewall allowed