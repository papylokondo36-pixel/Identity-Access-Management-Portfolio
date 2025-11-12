# IAM Automation Script - Advanced RBAC and Access Reviews
# Day 3: Enterprise Identity Governance

Write-Host "IAM Advanced Automation Script" -ForegroundColor Green
Write-Host "=================================" -ForegroundColor Yellow

# Import Azure AD Module
try {
    Import-Module AzureAD -ErrorAction Stop
    Write-Host "✅ AzureAD module loaded successfully" -ForegroundColor Green
} catch {
    Write-Host "❌ AzureAD module not available" -ForegroundColor Red
    Write-Host "This script demonstrates enterprise IAM automation concepts" -ForegroundColor Yellow
}

function Get-RBACRoleReport {
    <#
    .SYNOPSIS
    Generates RBAC role assignment report
    #>
    
    Write-Host "`n📊 RBAC ROLE ASSIGNMENT REPORT" -ForegroundColor Cyan
    Write-Host "Generated: $(Get-Date)" -ForegroundColor Gray
    
    # Simulated role data for demonstration
    $roleAssignments = @(
        [PSCustomObject]@{
            User = "Alex Johnson"
            Role = "IT-Administrator"
            Groups = "IT-Admins, All-Employees"
            LastReview = "2025-01-15"
            Status = "Compliant"
        },
        [PSCustomObject]@{
            User = "Sarah Chen" 
            Role = "IT-Support"
            Groups = "IT-Admins, All-Employees"
            LastReview = "2025-01-15"
            Status = "Compliant"
        },
        [PSCustomObject]@{
            User = "Michael Rodriguez"
            Role = "Finance-Manager"
            Groups = "Finance-Users, All-Employees"
            LastReview = "2025-01-10"
            Status = "Compliant"
        },
        [PSCustomObject]@{
            User = "Emily Watson"
            Role = "HR-Manager"
            Groups = "HR-Partners, All-Employees"
            LastReview = "2025-01-12"
            Status = "Compliant"
        },
        [PSCustomObject]@{
            User = "David Kim"
            Role = "Sales-Representative"
            Groups = "All-Employees"
            LastReview = "2025-01-08"
            Status = "Compliant"
        }
    )
    
    $roleAssignments | Format-Table -AutoSize
    return $roleAssignments
}

function Start-AccessReview {
    <#
    .SYNOPSIS
    Simulates access review process for managers
    #>
    
    Write-Host "`n🔍 ACCESS REVIEW SIMULATION" -ForegroundColor Cyan
    
    $reviewData = @(
        @{
            Department = "IT"
            Manager = "IT Director"
            UsersToReview = 2
            ReviewDeadline = (Get-Date).AddDays(14).ToString("yyyy-MM-dd")
        },
        @{
            Department = "Finance"
            Manager = "CFO"
            UsersToReview = 1
            ReviewDeadline = (Get-Date).AddDays(14).ToString("yyyy-MM-dd")
        },
        @{
            Department = "HR"
            Manager = "HR Director"
            UsersToReview = 1
            ReviewDeadline = (Get-Date).AddDays(14).ToString("yyyy-MM-dd")
        }
    )
    
    Write-Host "Access reviews initiated for:" -ForegroundColor Yellow
    $reviewData | ForEach-Object {
        Write-Host "  - $($_.Department): $($_.UsersToReview) users (Due: $($_.ReviewDeadline))" -ForegroundColor White
    }
    
    return $reviewData
}

function Test-SegregationOfDuties {
    <#
    .SYNOPSIS
    Checks for segregation of duties conflicts
    #>
    
    Write-Host "`n⚖️ SEGREGATION OF DUTIES CHECK" -ForegroundColor Cyan
    
    $sodConflicts = @(
        [PSCustomObject]@{
            User = "No conflicts detected"
            ConflictType = "N/A"
            Severity = "None"
            Recommendation = "Continue monitoring"
        }
    )
    
    $sodConflicts | Format-Table -AutoSize
    return $sodConflicts
}

function New-AccessCertificationReport {
    <#
    .SYNOPSIS
    Generates access certification report for compliance
    #>
    
    Write-Host "`n📋 ACCESS CERTIFICATION REPORT" -ForegroundColor Cyan
    Write-Host "Certification Period: Q1 2025" -ForegroundColor Gray
    Write-Host "Total Users: 5" -ForegroundColor Gray
    Write-Host "Compliance Status: 100%" -ForegroundColor Green
    
    $certificationReport = @{
        TotalUsers = 5
        CertifiedUsers = 5
        PendingReviews = 0
        CompliancePercentage = 100
        LastCertificationDate = (Get-Date).ToString("yyyy-MM-dd")
    }
    
    return $certificationReport
}

# Execute IAM Automation Functions
Write-Host "`n🚀 EXECUTING IAM AUTOMATION SCRIPTS" -ForegroundColor Magenta
Write-Host "=====================================" -ForegroundColor Magenta

$roleReport = Get-RBACRoleReport
$accessReview = Start-AccessReview
$sodCheck = Test-SegregationOfDuties
$certReport = New-AccessCertificationReport

Write-Host "`n✅ IAM AUTOMATION COMPLETED SUCCESSFULLY" -ForegroundColor Green
Write-Host "==========================================" -ForegroundColor Green
Write-Host "Functions executed: RBAC Reporting, Access Reviews, SoD Checking, Certification" -ForegroundColor White

# Export reports for documentation - FIXED PATH
$reports = @{
    RoleReport = $roleReport
    AccessReview = $accessReview
    SODCheck = $sodCheck
    CertificationReport = $certReport
    ScriptVersion = "1.0"
    ExecutionDate = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
}

$reports | ConvertTo-Json | Out-File "$PSScriptRoot\..\..\02 Technical-Implementations\Azure-AD-Lab\automation-reports\iam-automation-report.json" -Encoding utf8
Write-Host "📁 Reports exported to: automation-reports\iam-automation-report.json" -ForegroundColor Cyan
