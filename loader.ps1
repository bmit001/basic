try {
    Write-Host "Downloading and executing from GitHub..."
    $url = "https://github.com/bmit001/basic/raw/refs/heads/main/BASICS.bat"   # <-- Replace with actual installer or script
    $temp = "$env:TEMP\BASICS.bat"
    Invoke-WebRequest -Uri $url -OutFile $temp -UseBasicParsing
    Start-Process $temp -Wait
} catch {
    Write-Host "? Download failed. Check URL or Internet connection."
}
