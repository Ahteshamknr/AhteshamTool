# ===============================
# AhteshamTool PowerShell Launcher (Auto-delete EXE after close)
# ===============================

# Set download URL and paths
$exeUrl = "https://raw.githubusercontent.com/Ahteshamknr/AhteshamTool/main/AhteshamTool.exe"
$exePath = "$env:TEMP\AhteshamTool.exe"
$cmdPath = "$env:TEMP\delete_tool.cmd"

# Show download message
Write-Host "`n🔽 Downloading AhteshamTool..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing > $null 2>&1

# Show launch message
Write-Host "`n⚙️ Starting AhteshamTool.exe as administrator..." -ForegroundColor Cyan

# Create the self-deleting batch script using a here-string
$cmdContent = @'
@echo off
start "" /wait "%TEMP%\AhteshamTool.exe"
del /f /q "%TEMP%\AhteshamTool.exe"
del /f /q "%~f0"
'@

# Write batch file to disk
$cmdContent | Out-File -FilePath $cmdPath -Encoding ASCII

# Run the batch file as admin
Start-Process -FilePath $cmdPath -Verb RunAs
