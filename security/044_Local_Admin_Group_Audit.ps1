CopyEdit
$admins = Get-LocalGroupMember -Group "Administrators"
$admins | Format-Table Name, ObjectClass
🧠 Combine with Invoke-Command to run against multiple hosts
