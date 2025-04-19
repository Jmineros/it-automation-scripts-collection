CopyEdit
$hours = New-Object byte[] 21  # 21 = 7 days × 3 bytes/day
# Allow 9am–5pm Mon–Fri = byte 18–66 in weekday blocks
$users = Get-ADUser -Filter * -SearchBase "OU=Staff,DC=domain,DC=local"

foreach ($user in $users) {
Set-ADUser $user -LogonHours $hours
Write-Host "⏰ Applied login time limits to $($user.SamAccountName)"
}
Advanced usage may require byte-level bitmasking for hourly mapping.
