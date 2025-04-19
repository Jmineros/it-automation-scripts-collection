CopyEdit
# Enable audit (run once per folder)
$folder = "C:\SensitiveDocs"
icacls $folder /setaudit "(OI)(CI)(R,W,DC,WDAC,WO,FA,FX,FR):(AU)"

# Read logs (Event ID 4663)
Get-WinEvent -LogName Security -FilterXPath "*[System[EventID=4663]]" -MaxEvents 50 |
Where-Object { $_.Message -like "*ReadData*" -and $_.Message -like "*C:\SensitiveDocs*" } |
Select-Object TimeCreated, Message
⚠ Requires advanced auditing to be enabled in Group Policy.
