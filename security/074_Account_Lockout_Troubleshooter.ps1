CopyEdit
$events = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4740} -MaxEvents 20

foreach ($event in $events) {
$msg = $event.Message
$username = $msg -match "Account Name:\s+(\w+)" | Out-Null; $matches[1]
$caller = $msg -match "Caller Computer Name:\s+(\S+)" | Out-Null; $matches[1]
Write-Host "🔒 $username locked out from $caller"
}
