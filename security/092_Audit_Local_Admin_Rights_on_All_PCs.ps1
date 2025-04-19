CopyEdit
$computers = Get-ADComputer -Filter * | Select -ExpandProperty Name

foreach ($pc in $computers) {
try {
$admins = Invoke-Command -ComputerName $pc -ScriptBlock {
Get-LocalGroupMember -Group "Administrators"
}
Write-Host "💻 $pc Admins:"; $admins
} catch {
Write-Host "❌ Could not connect to $pc"
}
}
