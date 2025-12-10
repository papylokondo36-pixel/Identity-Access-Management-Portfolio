# Day 6 - Test All Scripts
Write-Host "🚀 DAY 6 - ADVANCED IAM POWERSHELL TESTING" -ForegroundColor Magenta
Write-Host ("=" * 60)

# Test each script
$scripts = @(
    @{Name="AD User Management"; File="ad-user-management.ps1"},
    @{Name="Password Policy Compliance"; File="password-policy-compliance.ps1"},
    @{Name="Access Review Automation"; File="access-review-automation.ps1"},
    @{Name="IAM Compliance Dashboard"; File="iam-compliance-dashboard.ps1"}
)

foreach ($script in $scripts) {
    Write-Host "`n🧪 Testing: $($script.Name)..." -ForegroundColor Cyan
    if (Test-Path $script.File) {
        try {
            & ".\$($script.File)"
            Write-Host "✅ $($script.Name) - SUCCESS" -ForegroundColor Green
        } catch {
            Write-Host "⚠️  $($script.Name) - ERROR: $_" -ForegroundColor Yellow
        }
    } else {
        Write-Host "❌ $($script.Name) - FILE NOT FOUND" -ForegroundColor Red
    }
}

# Show file listing
Write-Host "`n📁 DAY 6 FILES CREATED:" -ForegroundColor Yellow
Get-ChildItem *.ps1 | Format-Table Name, @{Name="Size(KB)";Expression={[math]::Round($_.Length/1KB,2)}}, LastWriteTime -AutoSize

Write-Host "`n" + "=" * 60
Write-Host "🎉 DAY 6 TESTING COMPLETED!" -ForegroundColor Magenta
Write-Host "📚 4 IAM PowerShell scripts created and tested" -ForegroundColor Cyan

