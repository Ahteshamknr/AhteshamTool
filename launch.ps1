# ===============================
# AhteshamTool PowerShell Launcher (Safe & Silent Auto-Delete)
# ===============================

# Set main paths
$exeUrl = "https://raw.githubusercontent.com/Ahteshamknr/AhteshamTool/main/AhteshamTool.exe"
$exePath = "$env:TEMP\AhteshamTool.exe"

# Safe folder for scripts
$safeFolder = "$env:LocalAppData\AhteshamToolCache"
New-Item -ItemType Directory -Path $safeFolder -Force | Out-Null

$batPath = "$safeFolder\deleter.cmd"
$vbsPath = "$safeFolder\silent_launcher.vbs"

# Show download message
Write-Host "`n🔽 Downloading AhteshamTool..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing > $null 2>&1

# Show launch message
Write-Host "`n⚙️ Starting AhteshamTool.exe as administrator..." -ForegroundColor Cyan

# Create deleter CMD
$batScript = @"
@echo off
start "" /wait "%TEMP%\AhteshamTool.exe"
del /f /q "%TEMP%\AhteshamTool.exe"
del /f /q "%~f0"
"@
Set-Content -Path $batPath -Value $batScript -Encoding ASCII

# Create silent launcher VBS
$vbsScript = @"
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run Chr(34) & "$batPath" & Chr(34), 0, False
"@
Set-Content -Path $vbsPath -Value $vbsScript -Encoding ASCII

# Launch the VBS (invisible)
Start-Process -FilePath $vbsPath
