# Force TLS 1.2 (needed for GitHub)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Network Path
$networkPath = "\\192.168.14.11\e\E\BASIC INSTALLATION\BASIC INSTALLATION\BASICS\BASICS.bat"

if (Test-Path $networkPath) {
    Write-Host "? Running from network path..."
    Start-Process $networkPath -Wait
} else {
    Write-Host "?? Network path not found, downloading from GitHub..."
    $webURL = "https://github.com/bmit001/basic/raw/refs/heads/main/BASICS.bat"
    $temp = "$env:TEMP\BASICS.bat"

    try {
        Invoke-WebRequest -Uri $webURL -OutFile $temp -UseBasicParsing
    } catch {
        Write-Host "?? Invoke-WebRequest failed, trying with Invoke-RestMethod..."
        (Invoke-RestMethod -Uri $webURL) | Out-File $temp -Encoding ASCII
    }

    if (Test-Path $temp) {
        Write-Host "? Download complete, running..."
        Start-Process $temp -Wait
    } else {
        Write-Host "? Failed to download BASICS.bat"
    }
}
