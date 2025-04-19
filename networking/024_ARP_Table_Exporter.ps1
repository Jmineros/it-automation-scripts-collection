CopyEdit
$arpOutput = arp -a | Out-String
$lines = $arpOutput -split "`n" | Where-Object { $_ -match "\d+\.\d+\.\d+\.\d+" }

$parsed = foreach ($line in $lines) {
$parts = $line -split '\s{2,}'
if ($parts.Count -eq 3) {
[PSCustomObject]@{
IPAddress = $parts[0]
MACAddress = $parts[1]
Type = $parts[2]
}
}
}

$parsed | Export-Csv -Path "C:\Logs\arp_table.csv" -NoTypeInformation
Write-Host "✅ ARP table exported."
