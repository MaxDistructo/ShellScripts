$ErrorActionPreference = "SilentlyContinue"
$ip = "192.168.1.60"
$url = "https://download.oracle.com/otn-pub/java/jdk/8u191-b12/2787e4a523244c269598db4e85c51e0c/jre-8u191-windows-x64.exe"
$input = ""

Write-Output "Process Communicator - Configuration Wizard"
Write-Output ""
Write-Output "Checking for Java"

if(Get-Command "java.exe" -ErrorAction SilentlyContinue -eq $null)
{
	Write-Host "Java was not found in your PATH."
	Write-Host "Installing the required Java version."
	md C:\tmp
	cd C:\tmp
	wget $url -outfile "java8_installer.exe"
	Write-Host "Installing Java"
	Start-Process -FilePath "java8_installer.exe" -ArgumentList "/s" -Wait
	Write-Host "Finished Installing Java"
}
Write-Host "Testing Java Install"
Invoke-Expression "java -version"

wget "https://www.dropbox.com/s/ssmzoiczdza2pxv/processcomunicator.jar?dl=1" -outfile "processcomunicator.jar"

$userin = Read-Host 'Input the IP of the Process Communicator server to connect to. If you were not given an additional IP, just hit enter.'

if(!([string]::IsNullOrEmpty($userin))){
	Invoke-Expression "java -jar processcomunicator.jar --ip " + $ip
}
else{
	Invoke-Expression "java -jar processcomunicator.jar"
}
