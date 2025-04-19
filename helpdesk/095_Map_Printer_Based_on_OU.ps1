CopyEdit
$user = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
$ou = (Get-ADUser $user -Properties CanonicalName).CanonicalName

switch -Wildcard ($ou) {
"*/Marketing*" { Add-Printer -ConnectionName "\\printserver\MarketingPrinter" }
"*/Finance*"   { Add-Printer -ConnectionName "\\printserver\FinancePrinter" }
"*/HR*"        { Add-Printer -ConnectionName "\\printserver\HRPrinter" }
default        { Write-Host "No matching OU for printer mapping." }
}
Run on user login or deploy via GPO.