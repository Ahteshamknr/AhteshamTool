# ===============================
# AhteshamTool PowerShell Launcher (Silent Auto-Delete)
# ===============================

# Set paths
$exeUrl = "https://raw.githubusercontent.com/Ahteshamknr/AhteshamTool/main/AhteshamTool.exe"
$exePath = "$env:TEMP\AhteshamTool.exe"
$batPath = "$env:TEMP\deleter.cmd"
$vbsPath = "$env:TEMP\silent_launcher.vbs"

# Show download message
Write-Host "`n🔽 Downloading AhteshamTool..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing > $null 2>&1

# Show launch message
Write-Host "`n⚙️ Starting AhteshamTool.exe as administrator..." -ForegroundColor Cyan

# Create batch file that deletes EXE after use
$batScript = @'
@echo off
start "" /wait "%TEMP%\AhteshamTool.exe"
del /f /q "%TEMP%\AhteshamTool.exe"
del /f /q "%~f0"
'@
Set-Content -Path $batPath -Value $batScript -Encoding ASCII

# Create VBS script to run batch file hidden
$vbsScript = @"
Set WshShell = CreateObject("WScript.Shell")
WshShell.Run Chr(34) & "$batPath" & Chr(34), 0, False
"@
Set-Content -Path $vbsPath -Value $vbsScript -Encoding ASCII

# Run the VBS (this launches the CMD silently)
Start-Process -FilePath $vbsPath
