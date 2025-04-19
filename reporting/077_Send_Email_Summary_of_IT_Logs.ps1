CopyEdit
$smtp = "smtp.yourdomain.com"
$from = "itmonitor@yourdomain.com"
$to = "admin@yourdomain.com"
$subject = "Daily IT Log Summary"
$body = Get-Content "C:\Logs\diskspace.txt" | Out-String

Send-MailMessage -To $to -From $from -Subject $subject -Body $body -SmtpServer $smtp
Write-Host "📧 Email sent."
