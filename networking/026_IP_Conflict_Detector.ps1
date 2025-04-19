CopyEdit
$events = Get-WinEvent -LogName System | Where-Object {
$_.Id -eq 4199 -and $_.ProviderName -eq "Tcpip"
}

if ($events) {
Write-Host "⚠️ Possible IP conflicts detected:"
$events | Select-Object -First 10 | Format-Table TimeCreated, Message -AutoSize
} else {
Write-Host "✅ No recent IP conflict events found."
}
