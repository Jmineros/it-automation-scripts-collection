CopyEdit
$archive = "D:\ArchivedProfiles"
$cutoff = (Get-Date).AddDays(-90)

Get-CimInstance -Class Win32_UserProfile | Where-Object {
$_.LastUseTime -lt $cutoff -and -not $_.Special
} | ForEach-Object {
$profilePath = $_.LocalPath
Move-Item -Path $profilePath -Destination $archive -Force
Write-Host "📦 Moved $profilePath"
}
Be sure no user is currently logged into that profile.
