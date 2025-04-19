CopyEdit
Import-Module ActiveDirectory
$cutoff = (Get-Date).AddDays(-60)

Get-ADUser -Filter * -Properties LastLogonDate | Where-Object {
$_.Enabled -eq $true -and $_.LastLogonDate -lt $cutoff
} | ForEach-Object {
Disable-ADAccount -Identity $_.SamAccountName
Write-Host "❌ Disabled: $($_.SamAccountName)"
}