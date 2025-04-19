CopyEdit
# Enforce local password policy

$secpol = @"
[System Access]
MinimumPasswordLength = 12
PasswordComplexity = 1
MaximumPasswordAge = 60
MinimumPasswordAge = 1
PasswordHistorySize = 24
"@

$policyFile = "$env:TEMP\local_password_policy.inf"
$secpol | Set-Content $policyFile

secedit /configure /db secedit.sdb /cfg $policyFile /areas SECURITYPOLICY
Write-Host "✅ Local password policy enforced."
