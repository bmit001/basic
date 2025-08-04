# Network share path where your installer is located
$networkPath = "\\192.168.1.100\Installers\BASICS.bat"

Write-Host "Launching installer from $networkPath ..." -ForegroundColor Cyan
Start-Process "cmd.exe" -ArgumentList "/c `"$networkPath`""
