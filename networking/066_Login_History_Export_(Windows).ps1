CopyEdit
$logins = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4624} -MaxEvents 100 |
Select-Object TimeCreated, @{Name="User";Expression={$_.Properties[5].Value}}

$logins | Export-Csv "C:\Logs\login_history.csv" -NoTypeInformation
Write-Host "✅ Login history saved to login_history.csv"
