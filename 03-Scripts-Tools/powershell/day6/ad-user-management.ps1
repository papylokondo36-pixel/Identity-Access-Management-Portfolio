# Day 6 - Active Directory User Management
param([string]$Action = "Report")

Write-Host "🔄 IAM User Management Console" -ForegroundColor Cyan
Write-Host ("=" * 50)

# Create log directory
$logDir = "C:\Logs\IAM\Day6"
New-Item -ItemType Directory -Path $logDir -Force | Out-Null

# Simulated user data
$users = @(
    [PSCustomObject]@{Username="admin.john"; Department="IT"; RiskScore=35; LastLogon="2024-01-15"},
    [PSCustomObject]@{Username="svc.backup"; Department="IT"; RiskScore=75; LastLogon="2024-01-20"},
    [PSCustomObject]@{Username="finance.mike"; Department="Finance"; RiskScore=50; LastLogon="2023-12-10"}
)

switch ($Action.ToLower()) {
    "report" {
        Write-Host "📊 User Security Report" -ForegroundColor Yellow
        $users | Format-Table -AutoSize
        
        $highRisk = ($users | Where-Object RiskScore -ge 50).Count
        Write-Host "`nHigh Risk Users: $highRisk" -ForegroundColor $(if($highRisk -gt 0){"Red"}else{"Green"})
    }
    default {
        Write-Host "Available actions: Report" -ForegroundColor Yellow
    }
}

Write-Host "`n✅ Script completed" -ForegroundColor Green

