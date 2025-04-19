CopyEdit
Connect-ExchangeOnline

Set-MailboxAutoReplyConfiguration -Identity "jane@domain.com" `
-AutoReplyState Enabled `
-InternalMessage "Hi, I'm on vacation until May 1." `
-ExternalMessage "Thank you for your email. I’ll reply after May 1."

Write-Host "📧 Out-of-office enabled for jane@domain.com"