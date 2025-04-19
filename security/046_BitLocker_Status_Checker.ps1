CopyEdit
$volumes = Get-BitLockerVolume

foreach ($volume in $volumes) {
$status = $volume.VolumeStatus
$protection = $volume.ProtectionStatus
Write-Host "Drive $($volume.MountPoint): Status=$status, Protection=$protection"
}
Extend this with Export-Csv to record to compliance logs.
