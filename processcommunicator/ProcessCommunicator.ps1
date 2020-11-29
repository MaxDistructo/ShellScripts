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
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
Write-Host "Testing Java Install"
Invoke-Expression "java -version"

wget "https://www.dropbox.com/s/rjxyod0v33od7m6/processcomunicator.jar?dl=1" -outfile "processcomunicator.jar"

$userin = Read-Host 'Input the IP of the Process Communicator server to connect to. If you were not given an additional IP, just hit enter.'

if(!([string]::IsNullOrEmpty($userin))){
	Invoke-Expression "java -jar processcomunicator.jar c --ip " + $ip
	break
}
Invoke-Expression "java -jar processcomunicator.jar"
