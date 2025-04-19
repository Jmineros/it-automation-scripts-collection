CopyEdit
$computers = @("PC01", "PC02")
$installer = "\\fileserver\deploy\chrome_installer.exe"

foreach ($pc in $computers) {
Invoke-Command -ComputerName $pc -ScriptBlock {
Start-Process -FilePath "C:\Temp\chrome_installer.exe" -ArgumentList "/silent" -Wait
} -ArgumentList $installer
}
🧠 Use PsExec or Intune for larger deployments
