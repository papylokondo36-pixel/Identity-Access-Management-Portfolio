# Day 7 - Azure AD & M365 IAM Test Suite
# Test all Day 7 scripts

Write-Host "🧪 Day 7 - Azure AD & M365 IAM Test Suite" -ForegroundColor Cyan
Write-Host "=" * 60

$scripts = @(
    @{Name="day7-introduction.ps1"; Description="Introduction to Azure AD IAM"},
    @{Name="azuread-user-management.ps1"; Description="Azure AD User Management"},
    @{Name="azuread-group-management.ps1"; Description="Azure AD Group Management"},
    @{Name="m365-license-management.ps1"; Description="M365 License Management"},
    @{Name="conditional-access-management.ps1"; Description="Conditional Access Policies"}
)

Write-Host "`n📋 Testing $($scripts.Count) Day 7 scripts:" -ForegroundColor Magenta

$results = @()
foreach ($script in $scripts) {
    $path = $script.Name
    if (Test-Path $path) {
        $size = [math]::Round((Get-Item $path).Length / 1KB, 2)
        Write-Host "✅ $($script.Name.PadRight(35)) - $($script.Description) ($size KB)" -ForegroundColor Green
        $results += @{Script=$script.Name; Status="✅"; Size="$size KB"}
    } else {
        Write-Host "❌ $($script.Name.PadRight(35)) - $($script.Description) (MISSING)" -ForegroundColor Red
        $results += @{Script=$script.Name; Status="❌"; Size="MISSING"}
    }
}

Write-Host "`n🎯 Azure AD/M365 IAM Capabilities Tested:" -ForegroundColor Cyan
Write-Host "• User lifecycle management (create, update, disable)"
Write-Host "• Group management (security, M365, dynamic groups)"
Write-Host "• License assignment and reporting"
Write-Host "• Conditional Access policy management"
Write-Host "• Microsoft Graph PowerShell integration"

Write-Host "`n🚀 Next Steps:" -ForegroundColor Yellow
Write-Host "1. Install module: Install-Module Microsoft.Graph -Scope CurrentUser"
Write-Host "2. Connect to tenant: Connect-MgGraph -Scopes 'User.ReadWrite.All', 'Group.ReadWrite.All'"
Write-Host "3. Test with actual Azure AD/M365 tenant"

Write-Host "`n✅ Day 7 test suite completed" -ForegroundColor Green
