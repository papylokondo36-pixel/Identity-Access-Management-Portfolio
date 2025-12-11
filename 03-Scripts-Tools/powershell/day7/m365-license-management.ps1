# Day 7 - Microsoft 365 License Management
# Automated license assignment and reporting

param(
    [string]$Action = "Report",
    [string]$UserPrincipalName,
    [string]$LicenseSKU
)

Write-Host "📋 Microsoft 365 License Management" -ForegroundColor Cyan
Write-Host "=" * 50

# Common Microsoft 365 License SKUs
$licenseSKUs = @{
    "ENTERPRISEPACK"    = "Office 365 E3"
    "ENTERPRISEPREMIUM" = "Office 365 E5"
    "EMS"               = "Enterprise Mobility + Security E3"
    "EMSPREMIUM"        = "Enterprise Mobility + Security E5"
    "MCOPSTN2"          = "Teams Phone Standard"
    "POWER_BI_PRO"      = "Power BI Pro"
    "PROJECTPROFESSIONAL" = "Project Professional"
}

function Show-LicenseReport {
    Write-Host "`n📊 License Utilization Report" -ForegroundColor Magenta
    Write-Host "`nLicense SKU               Assigned Available Total"
    Write-Host "----------               -------- --------- -----"
    Write-Host "Office 365 E3            125      375      500"
    Write-Host "Office 365 E5            50       450      500"
    Write-Host "EMS E3                   75       425      500"
    Write-Host "Teams Phone Standard     25       475      500"
    Write-Host "`nTotal Assigned Licenses: 275" -ForegroundColor Green
}

function Show-UserLicenses($upn) {
    Write-Host "`n👤 License Details for: $upn" -ForegroundColor Magenta
    Write-Host "`nService Plan              Status"
    Write-Host "------------              ------"
    Write-Host "EXCHANGE_S_ENTERPRISE     Active"
    Write-Host "SHAREPOINTENTERPRISE      Active"
    Write-Host "TEAMS1                    Active"
    Write-Host "OFFICESUBSCRIPTION        Active"
    Write-Host "`nTotal Assigned Plans: 4" -ForegroundColor Gray
}

switch ($Action.ToLower()) {
    "report" {
        Show-LicenseReport
        Write-Host "`n💡 Tip: Use Get-MgSubscribedSku for real license data" -ForegroundColor Yellow
    }
    
    "assign" {
        if ($UserPrincipalName -and $LicenseSKU) {
            Write-Host "🔗 Assigning License to User" -ForegroundColor Magenta
            Write-Host "User: $UserPrincipalName" -ForegroundColor Gray
            Write-Host "License SKU: $LicenseSKU" -ForegroundColor Gray
            
            if ($licenseSKUs.ContainsKey($LicenseSKU)) {
                Write-Host "License Name: $($licenseSKUs[$LicenseSKU])" -ForegroundColor Green
                Write-Host "`n✅ Ready to assign license" -ForegroundColor Green
                Write-Host "Actual command: Set-MgUserLicense -UserId $UserPrincipalName -AddLicenses @{SkuId = 'sku-id'}" -ForegroundColor Yellow
            } else {
                Write-Host "❌ Unknown License SKU. Available SKUs:" -ForegroundColor Red
                $licenseSKUs.GetEnumerator() | Sort-Object Name | ForEach-Object {
                    Write-Host "  $($_.Key.PadRight(20)) = $($_.Value)" -ForegroundColor Gray
                }
            }
        } else {
            Write-Host "❌ Missing parameters. Use: -Action Assign -UserPrincipalName 'user@domain.com' -LicenseSKU 'ENTERPRISEPACK'" -ForegroundColor Red
        }
    }
    
    "userreport" {
        if ($UserPrincipalName) {
            Show-UserLicenses -upn $UserPrincipalName
        } else {
            Write-Host "❌ UserPrincipalName parameter required for user report" -ForegroundColor Red
        }
    }
    
    "list" {
        Write-Host "📋 Available License SKUs" -ForegroundColor Magenta
        $licenseSKUs.GetEnumerator() | Sort-Object Name | ForEach-Object {
            Write-Host "• $($_.Key.PadRight(20)) = $($_.Value)" -ForegroundColor Gray
        }
    }
    
    default {
        Write-Host "❓ Unknown action. Use: Report, Assign, UserReport, or List" -ForegroundColor Red
        Show-LicenseReport
    }
}

Write-Host "`n✅ License Management script completed" -ForegroundColor Green
