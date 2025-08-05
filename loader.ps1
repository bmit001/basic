Write-Host "?? Executing installation directly from network path..."

$networkPath = "\\192.168.14.11\e\E\BASIC INSTALLATION\BASIC INSTALLATION\BASICS\BASICS.bat"

if (Test-Path $networkPath) {
    Write-Host "? Network path found. Running installer..."
    Start-Process $networkPath -Wait
} else {
    Write-Host "? Network path not found! Make sure the PC is connected to the correct network."
}
