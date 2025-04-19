CopyEdit
$threshold = 15
$report = Get-PSDrive -PSProvider FileSystem | ForEach-Object {
$used = (($_.Used / $_.Used + $_.Free) * 100)
$freePercent = 100 - $used
[PSCustomObject]@{
Drive = $_.Name
FreeGB = [math]::Round($_.Free / 1GB, 2)
FreePercent = [math]::Round($freePercent, 2)
Status = if ($freePercent -lt $threshold) { "⚠️ Low Space" } else { "OK" }
}
}

$report | Format-Table -AutoSize
$report | Export-Csv "C:\Logs\DiskSpaceReport.csv" -NoTypeInformation
