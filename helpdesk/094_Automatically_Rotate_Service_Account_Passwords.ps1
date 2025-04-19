CopyEdit
$account = "svc_app01"
$newPass = [System.Web.Security.Membership]::GeneratePassword(16, 4)

Set-ADAccountPassword -Identity $account -NewPassword (ConvertTo-SecureString $newPass -AsPlainText -Force) -Reset
Set-ADUser -Identity $account -ChangePasswordAtLogon $false

Write-Host "🔑 Rotated password for $account"
🔁 Store new passwords securely (e.g., Azure Key Vault, CyberArk, KeePass)
