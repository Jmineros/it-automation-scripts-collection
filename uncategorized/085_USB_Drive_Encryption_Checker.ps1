CopyEdit
$drives = Get-BitLockerVolume | Where-Object { $_.MountPoint -like "E:\" }

foreach ($d in $drives) {
$status = $d.ProtectionStatus
if ($status -eq 'On') {
Write-Host "🔐 USB Drive $($d.MountPoint) is encrypted"
} else {
Write-Host "⚠️ USB Drive $($d.MountPoint) is NOT encrypted"
}
}