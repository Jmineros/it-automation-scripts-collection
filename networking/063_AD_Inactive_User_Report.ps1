CopyEdit
Import-Module ActiveDirectory

$cutoff = (Get-Date).AddDays(-30)
$users = Get-ADUser -Filter * -Properties LastLogonDate |
Where-Object { $_.Enabled -eq $true -and $_.LastLogonDate -lt $cutoff }

$users | Select Name, SamAccountName, LastLogonDate | Export-Csv "C:\Logs\InactiveUsers.csv" -NoTypeInformation
