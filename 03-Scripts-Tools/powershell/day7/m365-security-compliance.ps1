# Day 7 - Microsoft 365 Security & Compliance Dashboard
# Comprehensive security monitoring and compliance automation

param(
    [string]$Action = "Dashboard",
    [switch]$ExportReport,
    [string]$ReportPath = ".\M365-Security-Report-$(Get-Date -Format 'yyyyMMdd').csv"
)

Write-Host "🛡️  Microsoft 365 Security & Compliance Dashboard" -ForegroundColor Cyan
Write-Host "=" * 60

# Security scoring function
function Get-SecurityScore {
    $score = 0
    $maxScore = 100
    
    # Simulated security checks
    $checks = @(
        @{Check="MFA for Admins"; Status=$true; Weight=20},
        @{Check="Conditional Access Policies"; Status=$true; Weight=15},
        @{Check="Audit Logging Enabled"; Status=$true; Weight=15},
        @{Check="Data Loss Prevention"; Status=$false; Weight=20},
        @{Check="Privileged Identity Management"; Status=$true; Weight=15},
        @{Check="Secure Score Monitoring"; Status=$true; Weight=15}
    )
    
    foreach ($check in $checks) {
        if ($check.Status) {
            $score += $check.Weight
        }
    }
    
    return [PSCustomObject]@{
        Score = $score
        MaxScore = $maxScore
        Percentage = [math]::Round(($score / $maxScore) * 100, 2)
        Checks = $checks
    }
}

# Compliance status function
function Get-ComplianceStatus {
    $compliance = @(
        @{Requirement="GDPR Compliance"; Status="Compliant"; LastChecked="2024-01-15"},
        @{Requirement="HIPAA Policies"; Status="Partial"; LastChecked="2024-01-10"},
        @{Requirement="SOC 2 Controls"; Status="Compliant"; LastChecked="2024-01-05"},
        @{Requirement="PCI DSS"; Status="Non-Compliant"; LastChecked="2024-01-01"},
        @{Requirement="ISO 27001"; Status="In Progress"; LastChecked="2024-01-12"}
    )
    
    return $compliance
}

# User risk analysis
function Get-UserRiskAnalysis {
    $riskyUsers = @(
        @{UPN="admin@contoso.com"; RiskLevel="High"; LastSignIn="2024-01-20 14:30"; Location="Unusual"},
        @{UPN="john.doe@contoso.com"; RiskLevel="Medium"; LastSignIn="2024-01-21 09:15"; Location="Expected"},
        @{UPN="inactive.user@contoso.com"; RiskLevel="Low"; LastSignIn="2023-12-01"; Location="N/A"}
    )
    
    return $riskyUsers
}

switch ($Action.ToLower()) {
    "dashboard" {
        # Display security dashboard
        Write-Host "`n📊 SECURITY DASHBOARD" -ForegroundColor Magenta
        Write-Host "-" * 40
        
        $securityScore = Get-SecurityScore
        Write-Host "🔒 Security Score: $($securityScore.Score)/$($securityScore.MaxScore) ($($securityScore.Percentage)%)" -ForegroundColor Green
        
        # Security Checks
        Write-Host "`n✅ Security Controls Status:" -ForegroundColor Gray
        foreach ($check in $securityScore.Checks) {
            $statusIcon = if ($check.Status) { "✅" } else { "❌" }
            Write-Host "$statusIcon $($check.Check) ($($check.Weight) points)" -ForegroundColor $(if ($check.Status) { "Green" } else { "Red" })
        }
        
        # Compliance Status
        Write-Host "`n📋 COMPLIANCE STATUS" -ForegroundColor Magenta
        Write-Host "-" * 40
        $compliance = Get-ComplianceStatus
        foreach ($item in $compliance) {
            $color = switch ($item.Status) {
                "Compliant" { "Green" }
                "Partial" { "Yellow" }
                "In Progress" { "Cyan" }
                default { "Red" }
            }
            Write-Host "$($item.Requirement): $($item.Status) (Last checked: $($item.LastChecked))" -ForegroundColor $color
        }
        
        # User Risk Analysis
        Write-Host "`n👤 USER RISK ANALYSIS" -ForegroundColor Magenta
        Write-Host "-" * 40
        $riskyUsers = Get-UserRiskAnalysis
        foreach ($user in $riskyUsers) {
            $color = switch ($user.RiskLevel) {
                "High" { "Red" }
                "Medium" { "Yellow" }
                default { "Gray" }
            }
            Write-Host "$($user.UPN): Risk Level=$($user.RiskLevel), Last Sign-In=$($user.LastSignIn)" -ForegroundColor $color
        }
        
        # Recommendations
        Write-Host "`n💡 SECURITY RECOMMENDATIONS" -ForegroundColor Yellow
        Write-Host "1. Enable Data Loss Prevention (DLP) policies"
        Write-Host "2. Implement Privileged Access Workstations"
        Write-Host "3. Configure automated threat detection"
        Write-Host "4. Review PCI DSS compliance gaps"
        Write-Host "5. Enable Microsoft Defender for Office 365"
    }
    
    "report" {
        Write-Host "📄 Generating Security Report..." -ForegroundColor Magenta
        
        $securityScore = Get-SecurityScore
        $compliance = Get-ComplianceStatus
        $riskyUsers = Get-UserRiskAnalysis
        
        # Create report object
        $report = [PSCustomObject]@{
            Timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
            SecurityScore = "$($securityScore.Score)/$($securityScore.MaxScore)"
            SecurityPercentage = $securityScore.Percentage
            ComplianceStatus = ($compliance | Where-Object { $_.Status -eq "Compliant" }).Count
            TotalRequirements = $compliance.Count
            RiskyUsers = $riskyUsers.Count
            HighRiskUsers = ($riskyUsers | Where-Object { $_.RiskLevel -eq "High" }).Count
        }
        
        # Display report
        $report | Format-List
        
        if ($ExportReport) {
            $report | Export-Csv -Path $ReportPath -NoTypeInformation
            Write-Host "✅ Report exported to: $ReportPath" -ForegroundColor Green
        }
    }
    
    "audit" {
        Write-Host "🔍 Security Audit Log" -ForegroundColor Magenta
        Write-Host "`nRecent Security Events:" -ForegroundColor Gray
        Write-Host "Timestamp              Event                           User"
        Write-Host "---------              -----                           ----"
        Write-Host "2024-01-21 09:15:00   Failed sign-in attempt          john.doe@contoso.com"
        Write-Host "2024-01-21 08:30:00   MFA registration completed      admin@contoso.com"
        Write-Host "2024-01-20 14:30:00   Unusual sign-in location        admin@contoso.com"
        Write-Host "2024-01-20 10:00:00   Conditional Access policy update System"
        Write-Host "2024-01-19 16:45:00   New admin user created          System"
    }
    
    "remediate" {
        Write-Host "⚡ Security Remediation Actions" -ForegroundColor Magenta
        Write-Host "`nAvailable Remediation Tasks:" -ForegroundColor Gray
        Write-Host "1. Reset high-risk user passwords"
        Write-Host "2. Block sign-ins from suspicious locations"
        Write-Host "3. Require MFA for all users"
        Write-Host "4. Review and remove excessive permissions"
        Write-Host "5. Enable audit logging for all services"
        
        Write-Host "`n💡 Run: Get-MgRiskDetection to get real risk detections" -ForegroundColor Yellow
    }
    
    default {
        Write-Host "❓ Unknown action. Use: Dashboard, Report, Audit, or Remediate" -ForegroundColor Red
    }
}

Write-Host "`n✅ Microsoft 365 Security & Compliance script completed" -ForegroundColor Green
Write-Host "`n🔗 Real Microsoft Graph Commands:" -ForegroundColor Yellow
Write-Host "• Get-MgSecuritySecureScore              - Get Microsoft Secure Score"
Write-Host "• Get-MgAuditLogDirectoryAudit           - View directory audit logs"
Write-Host "• Get-MgRiskDetection                    - Get risk detections"
Write-Host "• Get-MgInformationProtectionPolicyLabel - Get sensitivity labels"
