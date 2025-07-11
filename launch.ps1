# ===============================
# AhteshamTool PowerShell Launcher
# ===============================

Write-Host "`n🚀 Ahtesham Tool is launching..." -ForegroundColor Cyan

# Set download URL for the EXE file
$exeUrl = "https://raw.githubusercontent.com/Ahteshamknr/AhteshamTool/main/AhteshamTool.exe"
$exePath = "$env:TEMP\AhteshamTool.exe"

# Download the EXE to the temp folder
Write-Host "`n⬇️ Downloading tool to $exePath..."
Invoke-WebRequest -Uri $exeUrl -OutFile $exePath

# Run the tool as administrator
Write-Host "`n⚙️ Starting AhteshamTool.exe as administrator..."
Start-Process -FilePath $exePath -Verb RunAs
