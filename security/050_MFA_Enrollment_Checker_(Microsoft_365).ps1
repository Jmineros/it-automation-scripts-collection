CopyEdit
Connect-MsolService

$users = Get-MsolUser -All
foreach ($user in $users) {
$mfa = $user.StrongAuthenticationRequirements.State
if (-not $mfa) {
Write-Host "❌ MFA not enabled: $($user.UserPrincipalName)"
}
}