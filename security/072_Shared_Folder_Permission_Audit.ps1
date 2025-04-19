CopyEdit
$folder = "C:\Shared"
$acl = Get-Acl $folder
$acl.Access | Select-Object IdentityReference, FileSystemRights, AccessControlType |
Export-Csv "C:\Logs\FolderPermissionAudit.csv" -NoTypeInformation

Write-Host "🔒 Permissions exported for $folder"
