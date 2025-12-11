# Day 7 - Azure AD & Microsoft 365 IAM Automation
# Cloud identity management with Microsoft Graph PowerShell

Write-Host "🌤️  Azure AD & Microsoft 365 IAM Automation" -ForegroundColor Cyan
Write-Host "=" * 50

# Check if Microsoft.Graph module is installed
$requiredModule = "Microsoft.Graph"
if (Get-Module -ListAvailable -Name $requiredModule) {
    Write-Host "✅ $requiredModule module is available" -ForegroundColor Green
} else {
    Write-Host "⚠️  $requiredModule module is NOT installed" -ForegroundColor Yellow
    Write-Host "Run: Install-Module Microsoft.Graph -Scope CurrentUser" -ForegroundColor Gray
}

Write-Host "`n📋 Available cmdlets for Azure AD IAM:" -ForegroundColor Magenta
Write-Host "• Get-MgUser                  - List Azure AD users"
Write-Host "• New-MgUser                  - Create new Azure AD user"
Write-Host "• Set-MgUser                  - Update Azure AD user"
Write-Host "• Get-MgGroup                 - List Azure AD groups"
Write-Host "• New-MgGroup                 - Create new Azure AD group"
Write-Host "• Get-MgUserLicenseDetail     - Check user licenses"
Write-Host "• Get-MgConditionalAccessPolicy - View conditional access policies"
Write-Host "• Get-MgAuditLogSignIn        - View sign-in logs"

Write-Host "`n🚀 Ready for Azure AD/M365 IAM automation!" -ForegroundColor Green
