# IAM Portfolio Verification Script
Write-Host "
🔍 VERIFYING IAM PORTFOLIO DATA LOADING" -ForegroundColor Cyan
Write-Host "=" * 60

\https://papylokondo36-pixel.github.io/Identity-Access-Management-Portfolio/ = "https://papylokondo36-pixel.github.io/Identity-Access-Management-Portfolio/"

Write-Host "
🌐 Testing live site..." -ForegroundColor Yellow
try {
    \ = curl -s \https://papylokondo36-pixel.github.io/Identity-Access-Management-Portfolio/
    
    # Check for key content
    \System.Collections.Hashtable System.Collections.Hashtable System.Collections.Hashtable System.Collections.Hashtable System.Collections.Hashtable System.Collections.Hashtable System.Collections.Hashtable = @(
        @{name="Statistics"; pattern="stat-number"},
        @{name="Projects"; pattern="project-item"},
        @{name="Skills"; pattern="skill-tag"},
        @{name="Certifications"; pattern="cert-item"},
        @{name="Contact Info"; pattern="Get In Touch"}
    )
    
    foreach (\System.Collections.Hashtable in \System.Collections.Hashtable System.Collections.Hashtable System.Collections.Hashtable System.Collections.Hashtable System.Collections.Hashtable System.Collections.Hashtable System.Collections.Hashtable) {
        if (\ -match \System.Collections.Hashtable.pattern) {
            Write-Host "✅ \ found" -ForegroundColor Green
        } else {
            Write-Host "❌ \ missing" -ForegroundColor Red
        }
    }
    
    # Count stat items
    \ = (Select-String -InputObject \ -Pattern "stat-number" -AllMatches).Matches.Count
    Write-Host "
📊 Found \ statistics boxes" -ForegroundColor White
    
    if (\ -ge 4) {
        Write-Host "✅ All data boxes are populated!" -ForegroundColor Green
    }
    
    # Check for loading message
    if (\ -match "Loading portfolio statistics") {
        Write-Host "⚠️  Loading message still present" -ForegroundColor Yellow
    } else {
        Write-Host "✅ No loading messages - data is loaded!" -ForegroundColor Green
    }
    
} catch {
    Write-Host "❌ Verification failed: \" -ForegroundColor Red
}

Write-Host "
🚀 Quick access commands:" -ForegroundColor Cyan
Write-Host "1. Open site: Start-Process '\https://papylokondo36-pixel.github.io/Identity-Access-Management-Portfolio/'"
Write-Host "2. Check stats: curl -s '\https://papylokondo36-pixel.github.io/Identity-Access-Management-Portfolio/' | Select-String -Pattern 'stat-number' -Context 0,2"
Write-Host "3. Force refresh: Ctrl+F5 in browser"
Write-Host "
" + "=" * 60
