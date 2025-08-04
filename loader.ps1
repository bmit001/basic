# Loader script to run the batch installer from network path
$networkPath = "\\192.168.14.11\e\E\BASIC INSTALLATION\BASIC INSTALLATION\BASICS\BASICS.bat"
Start-Process -FilePath $networkPath -Wait
