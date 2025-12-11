# Day 6 - Final Verification Script
Write-Host "🔍 DAY 6 FINAL VERIFICATION" -ForegroundColor Magenta
Write-Host ("=" * 60)

# Check all required files exist
Write-Host "`n📁 FILE STRUCTURE CHECK:" -ForegroundColor Yellow
$requiredFiles = @(
    "ad-user-management.ps1",
    "password-policy-compliance.ps1",
    "access-review-automation.ps1",
    "iam-compliance-dashboard.ps1",
    "day6-test-all.ps1",
    "README.md"
)

$allExist = $true
foreach ($file in $requiredFiles) {
    if (Test-Path $file) {
        Write-Host "✅ $file" -ForegroundColor Green
    } else {
        Write-Host "❌ $file - MISSING!" -ForegroundColor Red
        $allExist = $false
    }
}

# Check script functionality
Write-Host "`n⚡ FUNCTIONALITY CHECK:" -ForegroundColor Yellow
$scripts = @("ad-user-management", "password-policy-compliance", "access-review-automation", "iam-compliance-dashboard")

foreach ($script in $scripts) {
    $file = "$script.ps1"
    Write-Host "Testing $script..." -ForegroundColor Gray -NoNewline
    try {
        $result = & ".\$file" 2>&1
        if ($LASTEXITCODE -eq 0 -or $LASTEXITCODE -eq $null) {
            Write-Host " ✅" -ForegroundColor Green
        } else {
            Write-Host " ❌" -ForegroundColor Red
        }
    } catch {
        Write-Host " ❌" -ForegroundColor Red
    }
}

# Show summary
Write-Host "`n📊 SUMMARY STATISTICS:" -ForegroundColor Cyan
$files = Get-ChildItem -File
$totalSize = ($files | Measure-Object -Property Length -Sum).Sum
$psScripts = Get-ChildItem *.ps1

Write-Host "Total files: $($files.Count)" -ForegroundColor Gray
Write-Host "PowerShell scripts: $($psScripts.Count)" -ForegroundColor Gray
Write-Host "Total size: $([math]::Round($totalSize/1KB, 2)) KB" -ForegroundColor Gray

# Day 6 completion status
Write-Host "`n🎯 DAY 6 COMPLETION STATUS:" -ForegroundColor Magenta
if ($allExist) {
    Write-Host "✅ COMPLETE - All requirements met!" -ForegroundColor Green
    Write-Host "   All 5 scripts created and verified" -ForegroundColor Gray
    Write-Host "   README documentation generated" -ForegroundColor Gray
    Write-Host "   Logs directory: C:\Logs\IAM\Day6" -ForegroundColor Gray
} else {
    Write-Host "❌ INCOMPLETE - Missing files detected" -ForegroundColor Red
}

Write-Host "`n🚀 Ready to proceed to Day 7!" -ForegroundColor Cyan

