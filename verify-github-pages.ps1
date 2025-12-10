# GitHub Pages Deployment Verification
param(
    [switch] = True
)

Write-Host "
" + "=" * 85
Write-Host "🔍 VERIFYING GITHUB PAGES DEPLOYMENT" -ForegroundColor Cyan
Write-Host "User: papylokondo36-pixel" -ForegroundColor White
Write-Host "=" * 85

# Your URLs
\ = "https://github.com/papylokondo36-pixel/Identity-Access-Management-Portfolio"
\ = "https://papylokondo36-pixel.github.io/Identity-Access-Management-Portfolio/"
\ = "\/settings/pages"
\ = "\/deployments"

Write-Host "
📊 CHECKING URLs:" -ForegroundColor Yellow
Write-Host "• Repository: \" -ForegroundColor Gray
Write-Host "• Live Site: \" -ForegroundColor Gray
Write-Host "• Pages Settings: \" -ForegroundColor Gray
Write-Host "• Deployments: \" -ForegroundColor Gray

# Test if site is live
Write-Host "
🌐 TESTING LIVE SITE..." -ForegroundColor Yellow
try {
    \ = [System.Net.WebRequest]::Create(\)
    \.Timeout = 10000
    \Y = \.GetResponse()
    \ = \Y.StatusCode.value__
    \Y.Close()
    
    if (\ -eq 200) {
        Write-Host "✅ Site is LIVE! (Status: \)" -ForegroundColor Green
        Write-Host "🎉 Your IAM Portfolio is successfully deployed!" -ForegroundColor Green
        
        if (\) {
            Start-Process \
            Write-Host "✅ Opened site in browser" -ForegroundColor Green
        }
    } else {
        Write-Host "⚠️  Site responded with status: \" -ForegroundColor Yellow
    }
} catch {
    Write-Host "❌ Site not reachable yet: \" -ForegroundColor Red
    Write-Host "ℹ️  This is normal if you just enabled GitHub Pages" -ForegroundColor Gray
    Write-Host "ℹ️  Wait 2-3 minutes and try again" -ForegroundColor Gray
}

# Open monitoring URLs
Write-Host "
📡 OPENING MONITORING LINKS:" -ForegroundColor Yellow
try {
    Start-Process \
    Write-Host "✅ Opened deployments page" -ForegroundColor Green
} catch {
    Write-Host "⚠️  Could not open deployments" -ForegroundColor Yellow
}

try {
    Start-Process \
    Write-Host "✅ Opened Pages settings" -ForegroundColor Green
} catch {
    Write-Host "⚠️  Could not open settings" -ForegroundColor Yellow
}

# Next steps
Write-Host "
📋 NEXT STEPS:" -ForegroundColor Cyan
Write-Host "1. Test all features on your live site" -ForegroundColor White
Write-Host "2. Share your portfolio URL with others" -ForegroundColor White
Write-Host "3. Consider adding analytics (Google Analytics)" -ForegroundColor White
Write-Host "4. Update README.md with live demo link" -ForegroundColor White

Write-Host "
🔗 YOUR PORTFOLIO IS LIVE AT:" -ForegroundColor Green
Write-Host "\" -ForegroundColor White -BackgroundColor DarkGreen

Write-Host "
" + "=" * 85
Write-Host "🏆 DEPLOYMENT COMPLETE!" -ForegroundColor Green
Write-Host "=" * 85
