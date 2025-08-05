# Loader.ps1
$path = "\\192.168.14.11\e\E\BASIC INSTALLATION\BASIC INSTALLATION\BASICS\BASICS.bat"

if (Test-Path $path) {
    Write-Host "? Found network installer. Launching..."
    Start-Process -FilePath $path -Wait
} else {
    Write-Host "? Network path not found: $path"
    Pause
}
