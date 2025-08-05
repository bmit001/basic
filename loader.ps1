Write-Host "?? Checking network path..."
$netPath = "\\192.168.14.11\e\E\BASIC INSTALLATION\BASICS\BASICS.bat"

if (Test-Path $netPath) {
    Write-Host "? Network path found, launching installer..."
    Start-Process -FilePath $netPath -Wait
}
else {
    Write-Host "?? Network path not found, trying to download from GitHub..."
    try {
        $temp = "$env:TEMP\loader.ps1"
        $url  = "https://github.com/bmit001/basic/raw/refs/heads/main/loader.ps1"

        Invoke-WebRequest $url -OutFile $temp -UseBasicParsing
        Write-Host "? Downloaded from GitHub, executing..."
        Start-Process powershell -ArgumentList "-ExecutionPolicy Bypass -File `"$temp`"" -Wait
    }
    catch {
        Write-Host "? Failed to download or execute loader from GitHub."
    }
}
