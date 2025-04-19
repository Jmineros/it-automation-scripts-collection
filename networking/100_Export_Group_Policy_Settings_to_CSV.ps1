CopyEdit
$gpos = Get-GPO -All
$report = @()

foreach ($gpo in $gpos) {
$details = Get-GPOReport -Guid $gpo.Id -ReportType Xml
$report += [xml]$details
}

$report | Export-Clixml "C:\Logs\GPOExport.xml"
Write-Host "📄 Exported all GPO settings to GPOExport.xml"
You can transform XML to CSV using ConvertTo-Csv or Excel

