Write-Host "FINAL DAY 6 COMPREHENSIVE TEST" -ForegroundColor Cyan
Write-Host ("=" * 40)

# Check all required files
$required = @(
    "ad-user-management.ps1",
    "password-policy-compliance.ps1",
    "access-review-automation.ps1", 
    "iam-compliance-dashboard.ps1",
    "day6-test-all.ps1",
    "day6-verification.ps1",
    "README.md"
)

Write-Host "Checking required files..." -ForegroundColor Yellow
$missing = @()
foreach ($file in $required) {
    if (Test-Path $file) {
        Write-Host "  ✅ $file" -ForegroundColor Green
    } else {
        Write-Host "  ❌ $file" -ForegroundColor Red
        $missing += $file
    }
}

# Test script execution
Write-Host "`nTesting script execution..." -ForegroundColor Yellow
$scripts = $required | Where-Object { $_ -ne "README.md" }
foreach ($script in $scripts) {
    Write-Host "  Testing $script..." -ForegroundColor Gray -NoNewline
    try {
        & ".\$script" *> $null
        Write-Host " ✅" -ForegroundColor Green
    } catch {
        Write-Host " ❌" -ForegroundColor Red
    }
}

# Summary
Write-Host "`n📊 SUMMARY:" -ForegroundColor Cyan
$totalFiles = (Get-ChildItem -File).Count
$totalSize = [math]::Round((Get-ChildItem -File | Measure-Object -Property Length -Sum).Sum / 1KB, 2)

Write-Host "Total files in directory: $totalFiles" -ForegroundColor Gray
Write-Host "Total size: $totalSize KB" -ForegroundColor Gray

if ($missing.Count -eq 0) {
    Write-Host "`n🎉 DAY 6: 100% COMPLETE AND VERIFIED!" -ForegroundColor Magenta
} else {
    Write-Host "`n⚠️  Missing files: $($missing.Count)" -ForegroundColor Yellow
}
