CopyEdit
Connect-MsolService

$subs = Get-MsolSubscription
$subs | Select-Object SkuPartNumber, Status, TotalLicenses, ActiveUnits, NextLifecycleDate |
Export-Csv "C:\Logs\O365_LicenseExpiry.csv" -NoTypeInformation
Automate with Task Scheduler + Email reminder
