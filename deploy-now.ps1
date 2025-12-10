# Automated GitHub Deployment Script for papylokondo36-pixel
param(
    [switch] = False
)

Write-Host "🚀 Starting automated deployment..." -ForegroundColor Cyan
Write-Host "Target: papylokondo36-pixel/Identity-Access-Management-Portfolio" -ForegroundColor White

# Function to execute command with error checking
function Invoke-SafeCommand {
    param([string], [string], [string])
    
    try {
        Invoke-Expression \ 2>&1 | Out-Null
        if (\0 -eq 0) {
            Write-Host "✅ \" -ForegroundColor Green
            return \True
        } else {
            Write-Host "❌ \" -ForegroundColor Red
            return \False
        }
    } catch {
        Write-Host "❌ Error: \" -ForegroundColor Red
        return \False
    }
}

# Step 1: Add files
if (-not (Invoke-SafeCommand -Command "git add ." -SuccessMessage "Files added to git" -FailureMessage "Failed to add files")) {
    exit 1
}

# Step 2: Commit
\Deploy Identity & Access Management Portfolio to GitHub Pages - 2025-12-10 = "Deploy IAM Portfolio - 2025-12-10 01:42"
if (-not (Invoke-SafeCommand -Command "git commit -m "\Deploy Identity & Access Management Portfolio to GitHub Pages - 2025-12-10"" -SuccessMessage "Changes committed" -FailureMessage "Commit failed")) {
    # If commit fails because no changes, continue anyway
    Write-Host "ℹ️  No changes to commit" -ForegroundColor Gray
}

# Step 3: Set remote
\ = git remote get-url origin 2>&1
if (\0 -ne 0 -or \) {
    Write-Host "🔗 Configuring git remote..." -ForegroundColor Yellow
    git remote remove origin 2>&1 | Out-Null
    if (-not (Invoke-SafeCommand -Command "git remote add origin https://github.com/papylokondo36-pixel/Identity-Access-Management-Portfolio.git" -SuccessMessage "Remote configured" -FailureMessage "Failed to set remote")) {
        exit 1
    }
    git branch -M main 2>&1 | Out-Null
}

# Step 4: Push
Write-Host "📤 Pushing to GitHub..." -ForegroundColor Yellow
if (Invoke-SafeCommand -Command "git push -u origin main" -SuccessMessage "Successfully pushed to GitHub!" -FailureMessage "Push failed")) {
    Write-Host "
🎉 DEPLOYMENT SUCCESSFUL!" -ForegroundColor Green
    Write-Host "
🌐 Next steps:" -ForegroundColor Cyan
    Write-Host "1. Enable GitHub Pages:" -ForegroundColor White
    Write-Host "   https://github.com/papylokondo36-pixel/Identity-Access-Management-Portfolio/settings/pages" -ForegroundColor Gray
    Write-Host "2. Select: Branch: main, Folder: / (root)" -ForegroundColor White
    Write-Host "3. Your site will be at:" -ForegroundColor White
    Write-Host "   https://papylokondo36-pixel.github.io/Identity-Access-Management-Portfolio/" -ForegroundColor Green
} else {
    Write-Host "
❌ Deployment failed. Try manual commands above." -ForegroundColor Red
}
