CopyEdit
Connect-MsolService

$users = Get-MsolUser -UnlicensedUsersOnly
$sku = Get-MsolAccountSku | Where-Object { $_.AccountSkuId -match "E3" }

foreach ($user in $users) {
Set-MsolUserLicense -UserPrincipalName $user.UserPrincipalName -AddLicenses $sku.AccountSkuId
Write-Host "✅ Assigned license to $($user.UserPrincipalName)"
}
