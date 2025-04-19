CopyEdit
$info = @{
"Hostname" = $env:COMPUTERNAME
"OS" = (Get-CimInstance Win32_OperatingSystem).Caption
"CPU" = (Get-CimInstance Win32_Processor).Name
"RAM (GB)" = [math]::Round((Get-CimInstance Win32_ComputerSystem).TotalPhysicalMemory / 1GB, 2)
"IP Address" = (Get-NetIPAddress -AddressFamily IPv4 -InterfaceAlias "Ethernet" | Where-Object {$_.IPAddress -ne "127.0.0.1"}).IPAddress
"Disk Free (C:)" = [math]::Round((Get-PSDrive C).Free / 1GB, 2)
}
$info | Out-File "C:\Logs\SystemInfo_$env:COMPUTERNAME.txt"
$info
