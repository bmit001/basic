$localPath = "\\192.168.14.11\e\E\BASIC INSTALLATION\BASIC INSTALLATION\BASICS\BASICS.bat"
$webURL    = "https://github.com/bmit001/basic/raw/refs/heads/main/BASICS.bat"

if (Test-Path $localPath) {
    Write-Host "? Network path found, running from LAN..."
    Start-Process $localPath -Wait
}
else {
    Write-Host "?? Network path not found, downloading from GitHub..."
    $temp = "$env:TEMP\BASICS.bat"
    Invoke-WebRequest $webURL -OutFile $temp
    Start-Process $temp -Wait
}
