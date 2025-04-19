CopyEdit
$folder = "C:\SharedFolder"
$user = "DOMAIN\User"
$acl = Get-Acl $folder

$permission = "$user","Modify","ContainerInherit, ObjectInherit","None","Allow"
$accessRule = New-Object System.Security.AccessControl.FileSystemAccessRule $permission
$acl.SetAccessRule($accessRule)

Set-Acl $folder $acl
Write-Host "🔓 Permissions reset for $user on $folder"
