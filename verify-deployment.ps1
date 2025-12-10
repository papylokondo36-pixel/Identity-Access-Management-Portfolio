# GitHub Pages Deployment Verification
Write-Host "
" + "=" * 85
Write-Host "🌐 GITHUB PAGES DEPLOYMENT VERIFICATION" -ForegroundColor Cyan
Write-Host "=" * 85

# Check local files
Write-Host "
📁 LOCAL FILES CHECK:" -ForegroundColor Yellow
\ = @(
    "index.html",
    "css/style.css",
    "js/script.js",
    ".github/workflows/deploy.yml",
    "README.md",
    "package.json"
)

foreach (\github-pages-config.yml in \) {
    if (Test-Path \github-pages-config.yml) {
        Write-Host "✅ \github-pages-config.yml" -ForegroundColor Green
    } else {
        Write-Host "❌ \github-pages-config.yml" -ForegroundColor Red
    }
}

# Git status check
Write-Host "
💾 GIT STATUS CHECK:" -ForegroundColor Yellow
try {
    \ = git status --short 2>&1
    if (\0 -eq 0) {
        if (\) {
            Write-Host "⚠️  Uncommitted changes:" -ForegroundColor Yellow
            Write-Host \ -ForegroundColor White
        } else {
            Write-Host "✅ All changes committed" -ForegroundColor Green
        }
    }
} catch {
    Write-Host "⚠️  Git check failed" -ForegroundColor Yellow
}

# Deployment checklist
Write-Host "
✅ DEPLOYMENT CHECKLIST:" -ForegroundColor Cyan
Write-Host "1. [ ] Pushed code to GitHub" -ForegroundColor White
Write-Host "2. [ ] Enabled GitHub Pages in repository settings" -ForegroundColor White
Write-Host "3. [ ] GitHub Actions workflow completed successfully" -ForegroundColor White
Write-Host "4. [ ] Site loads at: https://[username].github.io/Identity-Access-Management-Portfolio/" -ForegroundColor White
Write-Host "5. [ ] All features work correctly on live site" -ForegroundColor White

Write-Host "
🔗 YOUR DEPLOYMENT URL:" -ForegroundColor Cyan
Write-Host "https://[username].github.io/Identity-Access-Management-Portfolio/" -ForegroundColor White

Write-Host "
" + "=" * 85
Write-Host "🚀 READY FOR DEPLOYMENT!" -ForegroundColor Green
Write-Host "=" * 85
