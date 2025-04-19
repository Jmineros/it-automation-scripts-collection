CopyEdit
$events = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4728,4729,4732,4733} -MaxEvents 50

$events | ForEach-Object {
[PSCustomObject]@{
Time = $_.TimeCreated
Message = $_.Message -replace "`r`n", " "
}
} | Export-Csv "C:\Logs\group_membership_changes.csv" -NoTypeInformation
IDs: 4728 = added to global group, 4729 = removed, etc.
