CopyEdit
param (
[string]$ComputerName = "192.168.1.100",
[int]$Width = 1280,
[int]$Height = 800
)

$rdpFile = "$env:TEMP\quickRDP.rdp"
@"
screen mode id:i:2
desktopwidth:i:$Width
desktopheight:i:$Height
full address:s:$ComputerName
"@ | Set-Content $rdpFile

Start-Process "mstsc.exe" -ArgumentList $rdpFile
