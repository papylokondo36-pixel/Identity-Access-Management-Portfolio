# Day 6 - IAM Compliance Dashboard
param([switch]$ShowDetails)

Write-Host "🛡️ IAM Compliance Dashboard" -ForegroundColor Cyan
Write-Host ("=" * 60)

# Simulated compliance data
$complianceData = @(
    [PSCustomObject]@{Category="User Accounts"; Check="Password Policy"; Status="✅"; Score=95},
    [PSCustomObject]@{Category="User Accounts"; Check="Account Expiry"; Status="❌"; Score=40},
    [PSCustomObject]@{Category="Access Control"; Check="Privileged Access"; Status="✅"; Score=90},
    [PSCustomObject]@{Category="Access Control"; Check="Role Assignments"; Status="⚠️"; Score=75},
    [PSCustomObject]@{Category="Audit"; Check="Log Retention"; Status="✅"; Score=100},
    [PSCustomObject]@{Category="Audit"; Check="Real-time Alerts"; Status="❌"; Score=30}
)

# Display dashboard
Write-Host "`n📊 COMPLIANCE OVERVIEW" -ForegroundColor Yellow

if ($ShowDetails) {
    $complianceData | Format-Table -AutoSize
} else {
    # Summary view
    $categories = $complianceData | Group-Object Category
    foreach ($cat in $categories) {
        $avgScore = [math]::Round(($cat.Group | Measure-Object -Property Score -Average).Average, 2)
        $status = if ($avgScore -ge 90) { "✅" } elseif ($avgScore -ge 70) { "⚠️" } else { "❌" }
        Write-Host "$status $($cat.Name): $avgScore%" -ForegroundColor $(if($avgScore -ge 90){"Green"}elseif($avgScore -ge 70){"Yellow"}else{"Red"})
    }
}

# Overall score
$overallScore = [math]::Round(($complianceData | Measure-Object -Property Score -Average).Average, 2)
$grade = if ($overallScore -ge 90) { "A" } elseif ($overallScore -ge 80) { "B" } elseif ($overallScore -ge 70) { "C" } else { "D" }

Write-Host "`n🎯 OVERALL COMPLIANCE SCORE: $overallScore% ($grade)" -ForegroundColor Magenta

# Risk indicators
$failed = ($complianceData | Where-Object Status -eq "❌").Count
$warning = ($complianceData | Where-Object Status -eq "⚠️").Count

Write-Host "`n🚨 RISK INDICATORS:" -ForegroundColor $(if($failed -gt 0){"Red"}elseif($warning -gt 0){"Yellow"}else{"Green"})
Write-Host "Critical issues: $failed" -ForegroundColor $(if($failed -gt 0){"Red"}else{"Gray"})
Write-Host "Warnings: $warning" -ForegroundColor $(if($warning -gt 0){"Yellow"}else{"Gray"})

Write-Host "`n✅ Dashboard generated successfully" -ForegroundColor Green

