CopyEdit
Add-Computer -DomainName "corp.domain.com" `
-Credential (Get-Credential) `
-OUPath "OU=Workstations,DC=corp,DC=domain,DC=com" `
-Restart
Use securely stored credentials or pre-defined GPO OU placement
