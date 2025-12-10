# GitHub Pages Deployment Monitor
# Save as: monitor-deployment.ps1

param([string]https://papylokondo36-pixel.github.io/Identity-Access-Management-Portfolio/ = "https://papylokondo36-pixel.github.io/Identity-Access-Management-Portfolio/")

function Test-Deployment {
    System.Collections.Hashtable = curl -s -I https://papylokondo36-pixel.github.io/Identity-Access-Management-Portfolio/
    ?? check-deployment.ps1 ?? verify-github-pages.ps1 = System.Collections.Hashtable[0]
    
    if (?? check-deployment.ps1 ?? verify-github-pages.ps1 -match "200") {
        Write-Host "[03:34:48] ✅ Site is UP: https://papylokondo36-pixel.github.io/Identity-Access-Management-Portfolio/" -ForegroundColor Green
        return True
    } else {
        Write-Host "[03:34:48] ❌ Site is DOWN: ?? check-deployment.ps1 ?? verify-github-pages.ps1" -ForegroundColor Red
        return False
    }
}

# Continuous monitoring
Write-Host "🚀 Monitoring IAM Portfolio Deployment..." -ForegroundColor Cyan
Write-Host "URL: https://papylokondo36-pixel.github.io/Identity-Access-Management-Portfolio/" -ForegroundColor White
Write-Host "Press Ctrl+C to stop
" -ForegroundColor Yellow

while (True) {
    Test-Deployment
    Start-Sleep -Seconds 300  # Check every 5 minutes
}
