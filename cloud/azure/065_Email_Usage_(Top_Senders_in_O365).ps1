CopyEdit
Connect-ExchangeOnline

$report = Get-MailTrafficReport -StartDate (Get-Date).AddDays(-30) -EndDate (Get-Date) |
Sort-Object TotalSendCount -Descending | Select-Object -First 10

$report | Format-Table DisplayName, TotalSendCount