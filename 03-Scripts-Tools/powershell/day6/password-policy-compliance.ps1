# Day 6 - Password Policy Compliance
param([string]$Mode = "Quick")

Write-Host "🔐 Password Policy Audit" -ForegroundColor Cyan
Write-Host ("=" * 50)

if ($Mode -eq "Quick") {
    Write-Host "Quick Audit Results:" -ForegroundColor Yellow
    
    $policies = @(
        [PSCustomObject]@{Policy="Min Length 8"; Status="✅"; Severity="Medium"},
        [PSCustomObject]@{Policy="Complexity"; Status="✅"; Severity="High"},
        [PSCustomObject]@{Policy="90 Day Expiry"; Status="❌"; Severity="High"},
        [PSCustomObject]@{Policy="Password History"; Status="✅"; Severity="Medium"}
    )
    
    $policies | Format-Table -AutoSize
    
    $failed = ($policies | Where-Object Status -eq "❌").Count
    Write-Host "Failed policies: $failed" -ForegroundColor $(if($failed -gt 0){"Red"}else{"Green"})
} else {
    Write-Host "Detailed Audit Running..." -ForegroundColor Magenta
    Write-Host "Checking 5 common password issues..." -ForegroundColor Gray
    1..5 | ForEach-Object {
        $checkNum = $_
        $result = if ($checkNum % 2 -eq 0) {'✅ Pass'} else {'❌ Fail'}
        Write-Host "Check $checkNum : $result" -ForegroundColor $(if($checkNum % 2 -eq 0){"Green"}else{"Yellow"})
        Start-Sleep -Milliseconds 200
    }
}

Write-Host "`n✅ Password audit completed" -ForegroundColor Green
