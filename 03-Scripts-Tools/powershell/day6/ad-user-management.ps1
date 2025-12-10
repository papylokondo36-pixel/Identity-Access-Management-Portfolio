# Day 6 - Active Directory User Management
# Complete IAM user lifecycle management

param(
    [string]$Action = "Report",
    [string]$Username,
    [string]$Department = "All",
    [switch]$Export
)

# Initialize logging directory
$logDir = "C:\Logs\IAM\Day6"
New-Item -ItemType Directory -Path $logDir -Force | Out-Null

function Write-IAMLog {
    param([string]$Message, [string]$Level = "INFO")
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logEntry = "[$timestamp] [$Level] $Message"
    
    switch ($Level) {
        "SUCCESS" { $color = "Green" }
        "ERROR"   { $color = "Red" }
        "WARN"    { $color = "Yellow" }
        "INFO"    { $color = "Cyan" }
        default   { $color = "White" }
    }
    
    Write-Host $logEntry -ForegroundColor $color
    
    # Also write to log file
    $logEntry | Out-File -FilePath "$logDir\ad-management-$(Get-Date -Format 'yyyyMMdd').log" -Append
}

function Get-UserSecurityReport {
    Write-IAMLog "Generating user security risk report..." -Level "INFO"
    
    # Simulated user data for practice
    $users = @()
    
    # IT Department
    $users += [PSCustomObject]@{
        Username = "admin.john"
        FullName = "John Administrator"
        Department = "IT"
        Title = "System Admin"
        Enabled = $true
        LastLogon = (Get-Date).AddDays(-2)
        PasswordAge = 45
        Groups = @("Administrators", "Domain Users", "Remote Desktop Users")
        RiskScore = 35
    }
    
    $users += [PSCustomObject]@{
        Username = "svc.backup"
        FullName = "Backup Service Account"
        Department = "IT"
        Title = "Service Account"
        Enabled = $true
        LastLogon = (Get-Date).AddDays(-1)
        PasswordAge = 400
        Groups = @("Backup Operators", "Domain Users")
        RiskScore = 75
    }
    
    $users += [PSCustomObject]@{
        Username = "dev.sarah"
        FullName = "Sarah Developer"
        Department = "IT"
        Title = "Developer"
        Enabled = $true
        LastLogon = (Get-Date).AddDays(-5)
        PasswordAge = 60
        Groups = @("Developers", "Domain Users")
        RiskScore = 15
    }
    
    # Finance Department
    $users += [PSCustomObject]@{
        Username = "finance.mike"
        FullName = "Mike Accountant"
        Department = "Finance"
        Title = "Accountant"
        Enabled = $true
        LastLogon = (Get-Date).AddDays(-30)
        PasswordAge = 120
        Groups = @("Finance Users", "Domain Users")
        RiskScore = 50
    }
    
    $users += [PSCustomObject]@{
        Username = "old.employee"
        FullName = "Former Employee"
        Department = "HR"
        Title = "Former Staff"
        Enabled = $true
        LastLogon = (Get-Date).AddDays(-365)
        PasswordAge = 500
        Groups = @("Domain Users")
        RiskScore = 90
    }
    
    # Filter by department if specified
    if ($Department -ne "All") {
        $users = $users | Where-Object Department -eq $Department
    }
    
    # Calculate risk levels
    $riskReport = $users | ForEach-Object {
        [PSCustomObject]@{
            Username = $_.Username
            Department = $_.Department
            LastLogon = $_.LastLogon.ToString("yyyy-MM-dd")
            PasswordAge = "$($_.PasswordAge) days"
            GroupCount = $_.Groups.Count
            RiskScore = $_.RiskScore
            RiskLevel = if ($_.RiskScore -ge 75) { "Critical" } elseif ($_.RiskScore -ge 50) { "High" } elseif ($_.RiskScore -ge 25) { "Medium" } else { "Low" }
            Groups = $_.Groups -join ", "
        }
    }
    
    return $riskReport | Sort-Object RiskScore -Descending
}

function New-IAMUser {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Username,
        [Parameter(Mandatory=$true)]
        [string]$FullName,
        [string]$Department = "IT",
        [string]$Title = "Employee",
        [string[]]$Groups = @("Domain Users")
    )
    
    Write-IAMLog "Creating new IAM user: $Username" -Level "INFO"
    
    # Simulate user creation
    $user = [PSCustomObject]@{
        Username = $Username
        FullName = $FullName
        Department = $Department
        Title = $Title
        Email = "$Username@company.com"
        Groups = $Groups
        Created = Get-Date
        Status = "Active"
        PasswordSet = Get-Date
        AccountSID = "S-1-5-21-$(Get-Random -Minimum 1000000 -Maximum 9999999)-$(Get-Random -Minimum 1000000 -Maximum 9999999)-$(Get-Random -Minimum 1000 -Maximum 9999)"
    }
    
    Write-IAMLog "User $Username created successfully" -Level "SUCCESS"
    Write-IAMLog "Assigned to groups: $($Groups -join ', ')" -Level "INFO"
    
    return $user
}

function Remove-IAMUser {
    param(
        [Parameter(Mandatory=$true)]
        [string]$Username,
        [string]$Reason = "Standard offboarding"
    )
    
    Write-IAMLog "Starting deprovisioning process for: $Username" -Level "WARN"
    
    $steps = @(
        "1. Disabling user account",
        "2. Removing group memberships",
        "3. Setting out of office reply",
        "4. Archiving user data",
        "5. Generating offboarding report"
    )
    
    foreach ($step in $steps) {
        Write-IAMLog $step -Level "INFO"
        Start-Sleep -Milliseconds 300
    }
    
    $result = [PSCustomObject]@{
        Username = $Username
        Action = "Deprovisioned"
        Reason = $Reason
        Timestamp = Get-Date
        Status = "Completed"
        ReportPath = "$logDir\offboarding-$Username-$(Get-Date -Format 'yyyyMMdd').txt"
    }
    
    Write-IAMLog "User $Username deprovisioned successfully" -Level "SUCCESS"
    
    return $result
}

function Test-UserCompliance {
    param([string]$Username)
    
    Write-IAMLog "Running compliance check for: $Username" -Level "INFO"
    
    $checks = @(
        @{Test="Password Complexity"; Required="Yes"; Actual="Yes"; Compliant=$true},
        @{Test="Password Age < 90 days"; Required="Yes"; Actual="No"; Compliant=$false},
        @{Test="MFA Enabled"; Required="Yes"; Actual="Yes"; Compliant=$true},
        @{Test="Account Lockout Enabled"; Required="Yes"; Actual="Yes"; Compliant=$true},
        @{Test="Last Login < 90 days"; Required="Yes"; Actual="Yes"; Compliant=$true},
        @{Test="Admin Access Justified"; Required="Yes"; Actual="Yes"; Compliant=$true}
    )
    
    $complianceReport = $checks | ForEach-Object {
        [PSCustomObject]@{
            Check = $_.Test
            Required = $_.Required
            Actual = $_.Actual
            Status = if ($_.Compliant) { "✅ Compliant" } else { "❌ Non-Compliant" }
        }
    }
    
    $score = [math]::Round((($checks | Where-Object Compliant -eq $true).Count / $checks.Count) * 100, 2)
    
    return [PSCustomObject]@{
        Username = $Username
        CheckDate = Get-Date
        ComplianceScore = $score
        Grade = if ($score -ge 90) { "A" } elseif ($score -ge 80) { "B" } elseif ($score -ge 70) { "C" } else { "D" }
        Details = $complianceReport
    }
}

# Main execution
Write-Host "`n🔄 IAM USER MANAGEMENT CONSOLE" -ForegroundColor Cyan
Write-Host "=" * 60

switch ($Action.ToLower()) {
    "report" {
        Write-Host "`n📊 USER SECURITY RISK REPORT" -ForegroundColor Yellow
        Write-Host "-" * 40
        
        $report = Get-UserSecurityReport
        
        if ($Department -ne "All") {
            Write-Host "Filter: $Department Department" -ForegroundColor Gray
        }
        
        $report | Format-Table Username, Department, RiskLevel, RiskScore, LastLogon, PasswordAge -AutoSize
        
        # Summary
        $critical = ($report | Where-Object RiskLevel -eq "Critical").Count
        $high = ($report | Where-Object RiskLevel -eq "High").Count
        $total = $report.Count
        
        Write-Host "`n📈 RISK SUMMARY:" -ForegroundColor Magenta
        Write-Host "Critical Risk: $critical users" -ForegroundColor $(if($critical -gt 0){"Red"}else{"Green"})
        Write-Host "High Risk: $high users" -ForegroundColor $(if($high -gt 0){"Yellow"}else{"Green"})
        Write-Host "Total Users: $total" -ForegroundColor "Cyan"
        
        if ($Export) {
            $exportPath = "$logDir\security-report-$(Get-Date -Format 'yyyyMMdd-HHmmss').csv"
            $report | Export-Csv -Path $exportPath -NoTypeInformation
            Write-Host "✅ Report exported to: $exportPath" -ForegroundColor Green
        }
    }
    
    "create" {
        if (-not $Username) {
            Write-Host "❌ Error: Username is required for user creation" -ForegroundColor Red
            Write-Host "Usage: .\ad-user-management.ps1 -Action Create -Username 'new.user' -Department 'IT'" -ForegroundColor Yellow
            break
        }
        
        Write-Host "`n👤 CREATING NEW USER" -ForegroundColor Yellow
        Write-Host "-" * 40
        
        $fullName = Read-Host "Enter full name"
        $department = Read-Host "Enter department (default: IT)"
        if ([string]::IsNullOrWhiteSpace($department)) { $department = "IT" }
        
        $newUser = New-IAMUser -Username $Username -FullName $fullName -Department $department
        
        Write-Host "`n✅ USER CREATED SUCCESSFULLY:" -ForegroundColor Green
        $newUser | Format-List
    }
    
    "remove" {
        if (-not $Username) {
            Write-Host "❌ Error: Username is required for user removal" -ForegroundColor Red
            break
        }
        
        Write-Host "`n⚠️  USER DEPROVISIONING" -ForegroundColor Red
        Write-Host "-" * 40
        
        $confirm = Read-Host "Are you sure you want to remove user '$Username'? (yes/no)"
        
        if ($confirm -eq "yes") {
            $reason = Read-Host "Enter reason for removal"
            $result = Remove-IAMUser -Username $Username -Reason $reason
            
            Write-Host "`n📋 DEPROVISIONING COMPLETE:" -ForegroundColor Green
            $result | Format-List
        } else {
            Write-IAMLog "User removal cancelled" -Level "INFO"
        }
    }
    
    "compliance" {
        Write-Host "`n📋 COMPLIANCE CHECK" -ForegroundColor Yellow
        Write-Host "-" * 40
        
        if ($Username) {
            $compliance = Test-UserCompliance -Username $Username
            Write-Host "User: $Username" -ForegroundColor Cyan
            Write-Host "Compliance Score: $($compliance.ComplianceScore)% ($($compliance.Grade))" -ForegroundColor $(if($compliance.ComplianceScore -ge 80){"Green"}elseif($compliance.ComplianceScore -ge 60){"Yellow"}else{"Red"})
            $compliance.Details | Format-Table -AutoSize
        } else {
            # Test multiple users
            $testUsers = @("admin.john", "svc.backup", "finance.mike")
            foreach ($user in $testUsers) {
                $comp = Test-UserCompliance -Username $user
                Write-Host "$user : $($comp.ComplianceScore)% ($($comp.Grade))" -ForegroundColor $(if($comp.ComplianceScore -ge 80){"Green"}elseif($comp.ComplianceScore -ge 60){"Yellow"}else{"Red"})
            }
        }
    }
    
    default {
        Write-Host "❌ Unknown action: $Action" -ForegroundColor Red
        Write-Host "Available actions: Report, Create, Remove, Compliance" -ForegroundColor Yellow
    }
}

Write-Host "`n✅ IAM User Management completed" -ForegroundColor Green
Write-Host "Logs saved to: $logDir" -ForegroundColor Gray
