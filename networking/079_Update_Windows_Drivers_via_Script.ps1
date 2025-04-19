CopyEdit
Get-WindowsUpdate -MicrosoftUpdate -AcceptAll -Category "Drivers" -Install -IgnoreReboot
Write-Host "🔧 Driver updates completed."
Requires PSWindowsUpdate module
