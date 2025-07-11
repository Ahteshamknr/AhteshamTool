# ===============================
# AhteshamTool PowerShell Launcher (Auto-delete EXE after close)
# ===============================

# Set download URL and path
$exeUrl = "https://raw.githubusercontent.com/Ahteshamknr/AhteshamTool/main/AhteshamTool.exe"
$exePath = "$env:TEMP\AhteshamTool.exe"
$cmdPath = "$env:TEMP\delete_tool.cmd"

# Show download message
Write-Host "`n🔽 Downloading AhteshamTool..." -ForegroundColor Yellow
Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing > $null 2>&1

# Show launch message
Write-Host "`n⚙️ Starting AhteshamTool.exe as administrator..." -ForegroundColor Cyan

# Build CMD code to wait and delete
$cmd = "@echo off`n" +
       "start \"\" /wait \"$exePath\"`n" +
       "del /f /q \"$exePath\"`n" +
       "del /f /q \"%~f0\""

# Write CMD to temp file
$cmd | Out-File -FilePath $cmdPath -Encoding ASCII

# Run the CMD file as admin (it will wait for EXE to close, then delete it and itself)
Start-Process -FilePath $cmdPath -Verb RunAs
