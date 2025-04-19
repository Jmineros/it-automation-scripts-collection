CopyEdit
# Uninstall network printer
$printerName = "OfficePrinter"

Remove-Printer -Name $printerName
Write-Host "🗑️ $printerName removed."
🔁 Add to login scripts or Intune deployment
🖨️ Map based on group/OU via logic