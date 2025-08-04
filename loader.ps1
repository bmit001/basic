# Network share path where your installer is located
$networkPath = "\\"\\192.168.14.11\e\E\BASIC INSTALLATION\BASIC INSTALLATION\BASICS\BASICS.bat""

Write-Host "Launching installer from $networkPath ..." -ForegroundColor Cyan
Start-Process "cmd.exe" -ArgumentList "/c `"$networkPath`""
