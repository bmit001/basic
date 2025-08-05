# =============================
# UNIVERSAL LOADER (UPDATED)
# =============================

# Force TLS 1.2 (Required for GitHub Downloads)
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Paths
$networkPath = "\\192.168.14.11\e\E\BASIC INSTALLATION\BASIC INSTALLATION\BASICS\BASICS.bat"
$webURL      = "https://github.com/bmit001/basic/raw/refs/heads/main/BASICS.bat"
$temp        = "$env:TEMP\BASICS.bat"

# Try to run from network
if (Test-Path $networkPath) {
    Write-Host "? Found network path. Running directly..."
    Start-Process $networkPath -Wait
}
else {
    Write-Host "?? Network path not found, downloading from GitHub..."
    try {
        Invoke-WebRequest -Uri $webURL -OutFile $temp -UseBasicParsing
    } catch {
        Write-Host "?? Invoke-WebRequest failed, trying with Invoke-RestMethod..."
        try {
            (Invoke-RestMethod -Uri $webURL) | Out-File $temp -Encoding ASCII
        } catch {
            Write-Host "? Download failed. Check your internet or URL."
            exit
        }
    }

    if (Test-Path $temp) {
        Write-Host "? Download complete. Running script..."
        Start-Process $temp -Wait
    } else {
        Write-Host "? Could not download BASICS.bat."
    }
}
