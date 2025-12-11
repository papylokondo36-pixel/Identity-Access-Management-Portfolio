# Day 7 - Azure AD User Management
# Comprehensive Azure AD user lifecycle automation

param(
    [string]$Action = "Report",
    [string]$UserPrincipalName,
    [string]$DisplayName,
    [string]$Department
)

Write-Host "🌤️  Azure AD User Management Console" -ForegroundColor Cyan
Write-Host "=" * 50

# Function to check Microsoft.Graph module
function Test-GraphModule {
    if (-not (Get-Module -ListAvailable -Name Microsoft.Graph)) {
        Write-Host "❌ Microsoft.Graph module is not installed." -ForegroundColor Red
        Write-Host "Install with: Install-Module Microsoft.Graph -Scope CurrentUser" -ForegroundColor Yellow
        return $false
    }
    return $true
}

# Main script logic
switch ($Action.ToLower()) {
    "report" {
        Write-Host "📊 Azure AD User Report" -ForegroundColor Magenta
        Write-Host "`n(Simulated output - requires Microsoft.Graph authentication)"
        Write-Host "`nUserPrincipalName           DisplayName          Department"
        Write-Host "-----------------           -----------          ----------"
        Write-Host "admin@contoso.com           Admin User           IT"
        Write-Host "john.doe@contoso.com        John Doe             Sales"
        Write-Host "jane.smith@contoso.com      Jane Smith           Marketing"
        Write-Host "`nTotal Users: 3" -ForegroundColor Green
    }
    
    "create" {
        Write-Host "👤 Creating Azure AD User..." -ForegroundColor Magenta
        if ($UserPrincipalName -and $DisplayName) {
            Write-Host "User Principal Name: $UserPrincipalName" -ForegroundColor Gray
            Write-Host "Display Name: $DisplayName" -ForegroundColor Gray
            Write-Host "Department: $Department" -ForegroundColor Gray
            Write-Host "`n✅ User creation parameters ready" -ForegroundColor Green
            Write-Host "Actual creation requires: Connect-MgGraph -Scopes 'User.ReadWrite.All'" -ForegroundColor Yellow
        } else {
            Write-Host "❌ Missing parameters. Use: -Action Create -UserPrincipalName 'user@domain.com' -DisplayName 'User Name'" -ForegroundColor Red
        }
    }
    
    "license" {
        Write-Host "📋 License Management" -ForegroundColor Magenta
        Write-Host "`nAvailable License SKUs:" -ForegroundColor Gray
        Write-Host "• ENTERPRISEPACK      - Office 365 E3"
        Write-Host "• ENTERPRISEPREMIUM   - Office 365 E5"
        Write-Host "• EMS                 - Enterprise Mobility + Security"
        Write-Host "• MCOPSTN2            - Teams Phone Standard"
    }
    
    default {
        Write-Host "❓ Unknown action. Use: Report, Create, or License" -ForegroundColor Red
    }
}

Write-Host "`n✅ Azure AD User Management script completed" -ForegroundColor Green
