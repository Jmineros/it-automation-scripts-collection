CopyEdit
$driveLetter = "Z:"
$sharePath = "\\fileserver\shared"

If (!(Test-Path -Path $driveLetter)) {
New-PSDrive -Name "Z" -PSProvider FileSystem -Root $sharePath -Persist
Write-Host "✅ Mapped $driveLetter to $sharePath"
} else {
Write-Host "$driveLetter already exists."
}
