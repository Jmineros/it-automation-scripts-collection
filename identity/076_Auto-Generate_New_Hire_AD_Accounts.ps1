CopyEdit
Import-Module ActiveDirectory
$users = Import-Csv "C:\new_hires.csv"

foreach ($user in $users) {
$name = "$($user.FirstName) $($user.LastName)"
$username = "$($user.FirstName.Substring(0,1))$($user.LastName)"
$ou = "OU=$($user.Department),DC=company,DC=local"

New-ADUser -Name $name -SamAccountName $username `
-AccountPassword (ConvertTo-SecureString "TempPass123!" -AsPlainText -Force) `
-Enabled $true -Path $ou -ChangePasswordAtLogon $true

Add-ADGroupMember -Identity $user.Group -Members $username
Write-Host "✅ Created user: $username"
}
