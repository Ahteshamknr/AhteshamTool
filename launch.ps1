# ===============================
# AhteshamTool PowerShell Launcher
# ===============================

# Set download URL for the EXE file
$exeUrl = "https://raw.githubusercontent.com/Ahteshamknr/AhteshamTool/main/AhteshamTool.exe"
$exePath = "$env:TEMP\AhteshamTool.exe"

# Show downloading message
Write-Host "`n🔽 Downloading AhteshamTool..." -ForegroundColor Yellow

# Silently download the EXE to TEMP
Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing > $null 2>&1

# Show launching message
Write-Host "`n⚙️ Starting AhteshamTool.exe as administrator..." -ForegroundColor Cyan

# Run the tool as admin
Start-Process -FilePath $exePath -Verb RunAs
