CopyEdit
Import-Module PSWindowsUpdate
$missing = Get-WindowsUpdate -MicrosoftUpdate -AcceptAll -IgnoreReboot
$missing | Format-Table Title, KBArticle, Severity -AutoSize