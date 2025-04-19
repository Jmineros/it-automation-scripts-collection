CopyEdit
$report = @{
"Computer" = $env:COMPUTERNAME
"OS" = (Get-CimInstance Win32_OperatingSystem).Caption
"Uptime" = (Get-Date) - (gcim Win32_OperatingSystem).LastBootUpTime
"CPU Load (%)" = (Get-Counter '\Processor(_Total)\% Processor Time').CounterSamples[0].CookedValue
"RAM Free (MB)" = (Get-CimInstance Win32_OperatingSystem).FreePhysicalMemory / 1024
"Disk Free (C:)" = (Get-PSDrive C).Free / 1GB
}

$report | Out-File "C:\Logs\SystemHealth_$env:COMPUTERNAME.txt"
Write-Host "✅ System health report generated."
