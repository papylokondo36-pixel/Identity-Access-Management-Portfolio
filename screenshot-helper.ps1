function New-IAMScreenshot {
    param([string]$Name)
    
    $screenshotDir = "02 Technical-Implementations/Azure-AD-Lab/screenshots"
    $fullPath = "$screenshotDir/$Name.png"
    
    Write-Host "📸 Ready to capture: $Name" -ForegroundColor Yellow
    Write-Host "💾 Will save to: $fullPath" -ForegroundColor Cyan
    Write-Host "🛠️ Press Windows+Shift+S to capture screenshot" -ForegroundColor Green
    Write-Host "Then save to the path above with the exact name." -ForegroundColor Green
    Write-Host ""
}

# Usage examples:
# New-IAMScreenshot "groups-list"
# New-IAMScreenshot "new-user-form" 
