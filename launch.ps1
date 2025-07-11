# ===============================
# AhteshamTool PowerShell Launcher (Auto-delete EXE after close)
# ===============================

# Set paths
$exeUrl = "https://raw.githubusercontent.com/Ahteshamknr/AhteshamTool/main/AhteshamTool.exe"
$exePath = "$env:TEMP\AhteshamTool.exe"
$batPath = "$env:TEMP\deleter.cmd"

# Show download message
Write-Host "`n🔽 Downloading AhteshamTool..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing > $null 2>&1

# Show launch message
Write-Host "`n⚙️ Starting AhteshamTool.exe as administrator..." -ForegroundColor Cyan

# Write CMD script that runs the EXE, then deletes it and itself
$cmdScript = @'
@echo off
start "" /wait "%TEMP%\AhteshamTool.exe"
del /f /q "%TEMP%\AhteshamTool.exe"
del /f /q "%~f0"
'@
Set-Content -Path $batPath -Value $cmdScript -Encoding ASCII

# Run the CMD file as admin
Start-Process -FilePath $batPath -Verb RunAs
