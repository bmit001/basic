# Loader.ps1 - Launch BASICS.bat from network share

$path = "\\192.168.14.11\e\E\BASIC INSTALLATION\BASIC INSTALLATION\BASICS\BASICS.bat"

if (Test-Path $path) {
    Write-Host "Launching installer from network share..."
    Start-Process -FilePath $path -Wait
} else {
    Write-Host "? Network path not found: $path"
    Pause
}
