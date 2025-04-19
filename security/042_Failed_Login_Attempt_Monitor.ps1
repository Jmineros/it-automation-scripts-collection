CopyEdit
$logins = Get-WinEvent -FilterHashtable @{LogName='Security'; ID=4625} -MaxEvents 20 |
Select-Object TimeCreated, @{Name="User";Expression={($_.Properties[5].Value)}}, Message

$logins | Format-Table -AutoSize
