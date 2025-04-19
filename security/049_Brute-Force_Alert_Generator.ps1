CopyEdit
$events = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625; StartTime=(Get-Date).AddMinutes(-15)}
$grouped = $events | Group-Object { $_.Properties[18].Value }  # Source IP

foreach ($g in $grouped) {
if ($g.Count -ge 10) {
Write-Host "🚨 Possible brute-force from $($g.Name) - $($g.Count) failures"
}
}
