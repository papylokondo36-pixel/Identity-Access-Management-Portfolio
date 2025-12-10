# GitHub Pages Deployment Verification - FIXED VERSION
Clear-Host

Write-Host "`n" + "=" * 85
Write-Host "🔍 VERIFYING GITHUB PAGES DEPLOYMENT" -ForegroundColor Cyan
Write-Host "User: papylokondo36-pixel" -ForegroundColor White
Write-Host "=" * 85

# Your URLs
$repoURL = "https://github.com/papylokondo36-pixel/Identity-Access-Management-Portfolio"
$pagesURL = "https://papylokondo36-pixel.github.io/Identity-Access-Management-Portfolio/"
$settingsURL = "$repoURL/settings/pages"

Write-Host "`n📊 YOUR DEPLOYMENT LINKS:" -ForegroundColor Yellow
Write-Host "Repository: $repoURL" -ForegroundColor Gray
Write-Host "Live Site: $pagesURL" -ForegroundColor Gray
Write-Host "Pages Settings: $settingsURL" -ForegroundColor Gray

# Quick test
Write-Host "`n🌐 Testing if site is live..." -ForegroundColor Yellow

try {
    # Try to access the site
    $test = Invoke-WebRequest -Uri $pagesURL -TimeoutSec 10 -ErrorAction Stop
    Write-Host "✅ SUCCESS! Site is LIVE! (Status: $($test.StatusCode))" -ForegroundColor Green
    Write-Host "🎉 Your IAM Portfolio is deployed successfully!" -ForegroundColor Green
    
    # Open the site
    Start-Process $pagesURL
    Write-Host "✅ Opened site in browser" -ForegroundColor Green
    
    # Test features
    Write-Host "`n🧪 TEST THESE FEATURES:" -ForegroundColor Cyan
    Write-Host "1. Navigation menu" -ForegroundColor White
    Write-Host "2. IAM concepts cards (click them)" -ForegroundColor White
    Write-Host "3. API demo button" -ForegroundColor White
    Write-Host "4. Mobile responsiveness" -ForegroundColor White
    
} catch {
    Write-Host "❌ Site not reachable yet" -ForegroundColor Red
    Write-Host "`n⚠️  POSSIBLE REASONS:" -ForegroundColor Yellow
    Write-Host "1. GitHub Pages not enabled yet" -ForegroundColor White
    Write-Host "2. Deployment still in progress (wait 2-3 minutes)" -ForegroundColor White
    Write-Host "3. Repository is private (must be public for free GitHub Pages)" -ForegroundColor White
    
    Write-Host "`n🚀 ACTION REQUIRED:" -ForegroundColor Cyan
    Write-Host "1. Open this URL:" -ForegroundColor White
    Write-Host "   $settingsURL" -ForegroundColor Green
    Write-Host "2. Enable GitHub Pages:" -ForegroundColor White
    Write-Host "   • Select 'Deploy from a branch'" -ForegroundColor Gray
    Write-Host "   • Branch: 'main', Folder: '/ (root)'" -ForegroundColor Gray
    Write-Host "   • Click 'Save'" -ForegroundColor Gray
    Write-Host "3. Wait 2 minutes" -ForegroundColor White
    Write-Host "4. Run this script again" -ForegroundColor White
    
    # Open the settings page
    try {
        Start-Process $settingsURL
        Write-Host "✅ Opened Pages settings for you" -ForegroundColor Green
    } catch {
        Write-Host "⚠️  Manually go to: $settingsURL" -ForegroundColor Yellow
    }
}

Write-Host "`n📞 NEED HELP?" -ForegroundColor Yellow
Write-Host "• Check if repository is Public (not Private)" -ForegroundColor White
Write-Host "• Wait 3-5 minutes after enabling Pages" -ForegroundColor White
Write-Host "• Clear browser cache if needed" -ForegroundColor White

Write-Host "`n" + "=" * 85
Write-Host "🎯 READY FOR DEPLOYMENT!" -ForegroundColor Green
Write-Host "=" * 85
