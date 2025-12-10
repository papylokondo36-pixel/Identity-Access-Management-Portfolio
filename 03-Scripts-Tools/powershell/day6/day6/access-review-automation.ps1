# Day 6 - Access Review Automation
param([switch]$GenerateReport)

Write-Host "👥 Access Review Automation" -ForegroundColor Cyan
Write-Host ("=" * 50)

# Simulated access reviews
$reviews = @()
$departments = @("IT", "Finance", "HR", "Sales")

foreach ($dept in $departments) {
    1..3 | ForEach-Object {
        $reviews += [PSCustomObject]@{
            User = "$dept-user$_"
            Department = $dept
            Reviewer = "$dept-manager"
            Status = if($_ % 3 -eq 0){"Pending"}else{"Completed"}
            AccessLevel = if($_ -eq 1){"Elevated"}else{"Standard"}
        }
    }
}

Write-Host "Access Review Results:" -ForegroundColor Yellow
$reviews | Format-Table -AutoSize

# Summary
$completed = ($reviews | Where-Object Status -eq "Completed").Count
$total = $reviews.Count
$completionRate = [math]::Round(($completed / $total) * 100, 2)

Write-Host "`n📊 Review Summary:" -ForegroundColor Magenta
Write-Host "Completed: $completed/$total ($completionRate%)" -ForegroundColor Cyan
Write-Host "Pending: $($total - $completed)" -ForegroundColor $(if(($total - $completed) -gt 0){"Yellow"}else{"Green"})

# Generate report if requested
if ($GenerateReport) {
    $reportDir = "C:\Logs\IAM\AccessReviews"
    New-Item -ItemType Directory -Path $reportDir -Force | Out-Null
    
    $timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
    $reportPath = "$reportDir\access-review-$timestamp.csv"
    
    $reports = $reviews | Select-Object User, Department, Status, AccessLevel, @{Name="ReviewDate";Expression={Get-Date}}
    $reports | Export-Csv -Path $reportPath -NoTypeInformation
    
    Write-Host "✅ Report generated: $reportPath" -ForegroundColor Green
}

Write-Host "`n✅ Access review completed" -ForegroundColor Green

