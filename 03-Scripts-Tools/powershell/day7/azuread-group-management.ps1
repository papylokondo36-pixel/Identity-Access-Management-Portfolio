# Day 7 - Azure AD Group Management
# Security and Microsoft 365 group automation

param(
    [string]$Action = "List",
    [string]$GroupName,
    [string]$GroupType = "Security",
    [string]$Members
)

Write-Host "👥 Azure AD Group Management" -ForegroundColor Cyan
Write-Host "=" * 50

function Show-GroupTypes {
    Write-Host "`n📋 Group Types in Azure AD:" -ForegroundColor Magenta
    Write-Host "1. Security Groups       - Access management to resources"
    Write-Host "2. Microsoft 365 Groups  - Collaboration (Teams, SharePoint)"
    Write-Host "3. Dynamic Groups        - Membership based on rules/attributes"
}

switch ($Action.ToLower()) {
    "list" {
        Write-Host "📊 Azure AD Groups Report" -ForegroundColor Magenta
        Show-GroupTypes
        Write-Host "`n(Simulated Group Listing)"
        Write-Host "`nGroup Name              Type        Members"
        Write-Host "---------              ----        -------"
        Write-Host "All Employees          Security    250"
        Write-Host "IT Administrators      Security    15"
        Write-Host "Project Alpha          M365        25"
        Write-Host "Sales Team             Dynamic     45"
        Write-Host "`nTotal Groups: 4" -ForegroundColor Green
    }
    
    "create" {
        if ($GroupName) {
            Write-Host "🆕 Creating $GroupType Group: $GroupName" -ForegroundColor Magenta
            Write-Host "Group Type: $GroupType" -ForegroundColor Gray
            
            if ($GroupType -eq "Dynamic") {
                Write-Host "Dynamic Rule Example:" -ForegroundColor Yellow
                Write-Host "(user.department -eq `"Sales`") -or (user.jobTitle -contains `"Manager`")"
            }
            
            if ($Members) {
                Write-Host "Initial Members: $Members" -ForegroundColor Gray
            }
            
            Write-Host "`n✅ Group creation parameters ready" -ForegroundColor Green
        } else {
            Write-Host "❌ GroupName parameter is required for creation" -ForegroundColor Red
        }
    }
    
    "dynamic" {
        Write-Host "⚡ Dynamic Group Rule Builder" -ForegroundColor Magenta
        Write-Host "`nCommon Dynamic Membership Rules:" -ForegroundColor Gray
        Write-Host "• All users in department: (user.department -eq `"Sales`")"
        Write-Host "• All users with license: (user.assignedPlans -any (assignedPlan.servicePlanId -eq `"servicePlanId`"))"
        Write-Host "• Users in specific city: (user.city -eq `"New York`")"
        Write-Host "• Users with job title: (user.jobTitle -contains `"Manager`")"
    }
    
    default {
        Write-Host "❓ Unknown action. Use: List, Create, or Dynamic" -ForegroundColor Red
        Show-GroupTypes
    }
}

Write-Host "`n✅ Azure AD Group Management script completed" -ForegroundColor Green
