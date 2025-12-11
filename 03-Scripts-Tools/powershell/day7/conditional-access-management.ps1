# Day 7 - Conditional Access Policy Management
# Zero Trust security policy automation

param(
    [string]$Action = "List",
    [string]$PolicyName,
    [string]$Users,
    [string]$Platforms = "Windows,Android,iOS"
)

Write-Host "🛡️  Conditional Access Policy Management" -ForegroundColor Cyan
Write-Host "=" * 50

function Show-PolicyTemplates {
    Write-Host "`n📋 Conditional Access Policy Templates:" -ForegroundColor Magenta
    Write-Host "1. Require MFA for Admins"
    Write-Host "2. Block legacy authentication"
    Write-Host "3. Require compliant device"
    Write-Host "4. Block access from risky locations"
    Write-Host "5. Require MFA for high-risk apps"
    Write-Host "6. Session control for sensitive apps"
}

switch ($Action.ToLower()) {
    "list" {
        Write-Host "📊 Current Conditional Access Policies" -ForegroundColor Magenta
        Write-Host "`nPolicy Name                     State      Users"
        Write-Host "-----------                     -----      -----"
        Write-Host "Require MFA for Admins          Enabled    All admins"
        Write-Host "Block Legacy Auth               Enabled    All users"
        Write-Host "Require Compliant Device        Enabled    Finance dept"
        Write-Host "Block High-Risk Countries       Enabled    All users"
        Write-Host "`nTotal Policies: 4" -ForegroundColor Green
    }
    
    "create" {
        if ($PolicyName) {
            Write-Host "🆕 Creating Conditional Access Policy" -ForegroundColor Magenta
            Write-Host "Policy Name: $PolicyName" -ForegroundColor Gray
            Write-Host "Target Users: $($Users ?? 'All users')" -ForegroundColor Gray
            Write-Host "Platforms: $Platforms" -ForegroundColor Gray
            
            Write-Host "`n🔧 Policy Configuration:" -ForegroundColor Yellow
            Write-Host "• Grant Controls: Require MFA, Require compliant device"
            Write-Host "• Session Controls: Sign-in frequency every 8 hours"
            Write-Host "• Conditions: All cloud apps, All platforms"
            
            Write-Host "`n✅ Policy parameters ready" -ForegroundColor Green
        } else {
            Write-Host "❌ PolicyName parameter is required" -ForegroundColor Red
        }
    }
    
    "simulate" {
        Write-Host "🎯 Policy Simulation" -ForegroundColor Magenta
        Write-Host "`nSimulating sign-in scenarios:" -ForegroundColor Gray
        Write-Host "1. Admin from new device → Requires MFA" -ForegroundColor Yellow
        Write-Host "2. User from blocked country → Access denied" -ForegroundColor Red
        Write-Host "3. Legacy auth attempt → Blocked" -ForegroundColor Red
        Write-Host "4. Compliant device → Access granted" -ForegroundColor Green
    }
    
    "templates" {
        Show-PolicyTemplates
    }
    
    default {
        Write-Host "❓ Unknown action. Use: List, Create, Simulate, or Templates" -ForegroundColor Red
        Show-PolicyTemplates
    }
}

Write-Host "`n✅ Conditional Access Management script completed" -ForegroundColor Green
Write-Host "`n💡 Zero Trust Principles Applied:" -ForegroundColor Yellow
Write-Host "• Verify explicitly"
Write-Host "• Use least privilege access"
Write-Host "• Assume breach"
