# Quick GitHub Pages Deployment Script
# Run this after configuring your GitHub remote

param(
    [Parameter(Mandatory=True)]
    [string],
    
    [string]Deploy Identity & Access Management Portfolio to GitHub Pages - 2025-12-10 = "Deploy IAM Portfolio to GitHub Pages"
)

Write-Host "🚀 Starting GitHub Pages Deployment" -ForegroundColor Cyan
Write-Host "Repository: /Identity-Access-Management-Portfolio" -ForegroundColor White

# Step 1: Check git status
try {
    \ = git status --porcelain 2>&1
    if (\0 -eq 0) {
        if (-not [string]::IsNullOrEmpty(\)) {
            Write-Host "📦 Committing changes..." -ForegroundColor Yellow
            git add .
            git commit -m "\Deploy Identity & Access Management Portfolio to GitHub Pages - 2025-12-10"
            Write-Host "✅ Changes committed" -ForegroundColor Green
        } else {
            Write-Host "ℹ️  No changes to commit" -ForegroundColor Gray
        }
    }
} catch {
    Write-Host "⚠️  Git check failed" -ForegroundColor Yellow
}

# Step 2: Check remote
try {
    \origin	https://github.com/papylokondo36-pixel/Identity-Access-Management-Portfolio.git (fetch) origin	https://github.com/papylokondo36-pixel/Identity-Access-Management-Portfolio.git (push) upstream	https://github.com/papylokondo36-pixel/Identity-Access-Management-Portfolio.git (fetch) upstream	https://github.com/papylokondo36-pixel/Identity-Access-Management-Portfolio.git (push) = git remote get-url origin 2>&1
    if (\0 -ne 0) {
        Write-Host "🔗 Setting up git remote..." -ForegroundColor Yellow
        git remote add origin "https://github.com/\/Identity-Access-Management-Portfolio.git"
        git branch -M main
        Write-Host "✅ Remote configured" -ForegroundColor Green
    }
} catch {
    Write-Host "⚠️  Remote setup failed" -ForegroundColor Yellow
}

# Step 3: Push to GitHub
Write-Host "📤 Pushing to GitHub..." -ForegroundColor Yellow
try {
    git push -u origin main
    if (\0 -eq 0) {
        Write-Host "✅ Successfully pushed to GitHub!" -ForegroundColor Green
        
        # Show next steps
        Write-Host "
🌐 NEXT STEPS:" -ForegroundColor Cyan
        Write-Host "1. Enable GitHub Pages in repository settings:" -ForegroundColor White
        Write-Host "   https://github.com/\/Identity-Access-Management-Portfolio/settings/pages" -ForegroundColor Gray
        Write-Host "2. Select: Branch: main, Folder: / (root)" -ForegroundColor White
        Write-Host "3. Your site will be available at:" -ForegroundColor White
        Write-Host "   https://\.github.io/Identity-Access-Management-Portfolio/" -ForegroundColor Green
    } else {
        Write-Host "❌ Failed to push to GitHub" -ForegroundColor Red
    }
} catch {
    Write-Host "❌ Push failed: \" -ForegroundColor Red
}

Write-Host "
🏁 Deployment script completed" -ForegroundColor Cyan
