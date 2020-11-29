Write-Host "Testing Java Install"
Invoke-Expression "java -version"

wget "https://www.dropbox.com/s/rjxyod0v33od7m6/processcomunicator.jar?dl=1" -outfile "processcomunicator.jar"

$userin = Read-Host 'Input the IP of the Process Communicator server to connect to. If you were not given an additional IP, just hit enter.'

if(!([string]::IsNullOrEmpty($userin))){
	Invoke-Expression "java -jar processcomunicator.jar c --ip " + $ip
	break
}
Invoke-Expression "java -jar processcomunicator.jar"
