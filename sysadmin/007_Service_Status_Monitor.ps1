CopyEdit
# List of services to monitor
$services = @("Spooler", "wuauserv", "Dnscache", "CustomAppService")

$logPath = "C:\Logs\service_status_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"
New-Item -Path "C:\Logs" -ItemType Directory -Force | Out-Null

foreach ($service in $services) {
$svc = Get-Service -Name $service -ErrorAction SilentlyContinue
if ($svc.Status -ne "Running") {
Write-Host "⚠️ $service is $($svc.Status). Attempting restart..."
Restart-Service -Name $service -Force
Add-Content $logPath "$service was $($svc.Status). Restart attempted at $(Get-Date)"
} else {
Write-Host "✅ $service is running."
Add-Content $logPath "$service OK at $(Get-Date)"
}
}
Can be scheduled every 15 minutes or hourly
Extend with email alerts using Send-MailMessage