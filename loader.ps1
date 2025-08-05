# => Force TLS 1.2
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12

# Download and execute BASICS.bat from GitHub
$url = 'https://raw.githubusercontent.com/bmit001/basic/main/BASICS.bat'
$temp = "$env:TEMP\BASICS.bat"

try {
  Invoke-WebRequest -Uri $url -OutFile $temp -UseBasicParsing
} catch {
  try {
    Invoke-RestMethod -Uri $url | Out-File $temp -Encoding ASCII
  } catch {
    Write-Host "❌ Download failed. Check TLS, internet, or URL." -ForegroundColor Red
    exit 1
  }
}

Start-Process $temp -Wait
