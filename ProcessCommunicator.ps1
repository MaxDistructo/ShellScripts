$ErrorActionPreference = "SilentlyContinue"
$ip = "192.168.1.60"
$url = "https://www.dropbox.com/s/ithsb5o2cutewbp/jre-8u191-windows-x64.exe?dl=1"
$input = ""

Write-Output "Process Communicator - Configuration Wizard"
Write-Output ""
Write-Output "Checking for Java"
Get-Command "java.exe" -ErrorAction SilentlyContinue -eq $null
if(!$error)
{
	
} else{
	Write-Host "Java was not found in your PATH."
	Write-Host "Installing the required Java version."
	md C:\tmp
	cd C:\tmp
	wget $url -outfile "java8_installer.exe"
	Write-Host "Installing Java"
	Start-Process -FilePath "java8_installer.exe" -ArgumentList "/s" -Wait
	Write-Host "Finished Installing Java"
}
wget part2.ps1
