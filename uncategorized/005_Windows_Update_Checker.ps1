CopyEdit
# Windows Update Checker Script

# Ensure PSWindowsUpdate is installed
if (-not (Get-Module -ListAvailable -Name PSWindowsUpdate)) {
Install-Module -Name PSWindowsUpdate -Force -Scope CurrentUser
}

Import-Module PSWindowsUpdate

# Optional logging
$logFile = "C:\Logs\WindowsUpdateCheck_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"
New-Item -ItemType Directory -Path "C:\Logs" -Force | Out-Null

# Get available updates
$updates = Get-WindowsUpdate -AcceptAll -IgnoreReboot

if ($updates) {
"Pending Windows Updates:" | Tee-Object -FilePath $logFile -Append
$updates | Format-Table -AutoSize | Out-String | Tee-Object -FilePath $logFile -Append
} else {
"✅ No pending updates found." | Tee-Object -FilePath $logFile -Append
}

# Optional: Automatically install updates
# Uncomment below to enable auto-install
# Install-WindowsUpdate -AcceptAll -IgnoreReboot -AutoReboot | Tee-Object -FilePath $logFile -Append

🔁 Optional Enhancements:
Schedule Weekly Run: Via Task Scheduler
Remote Execution: Use Invoke-Command for remote update audits
Slack or Email Integration: Send a summary to your IT team