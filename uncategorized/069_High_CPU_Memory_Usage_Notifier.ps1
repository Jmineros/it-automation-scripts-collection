CopyEdit
$cpu = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples[0].CookedValue
$mem = (Get-Counter '\Memory\% Committed Bytes In Use').CounterSamples[0].CookedValue

if ($cpu -gt 80 -or $mem -gt 80) {
Write-Host "🚨 High resource usage detected!"
# Optionally send email or log it
}
