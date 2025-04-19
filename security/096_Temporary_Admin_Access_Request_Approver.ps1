CopyEdit
$username = "DOMAIN\jdoe"
Add-LocalGroupMember -Group "Administrators" -Member $username
Write-Host "✅ $username added to local admins."

Start-Sleep -Seconds 3600  # 1 hour

Remove-LocalGroupMember -Group "Administrators" -Member $username
Write-Host "⏱️ $username removed from local admins after 1 hour."
