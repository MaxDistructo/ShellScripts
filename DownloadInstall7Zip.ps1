$ErrorActionPreference = "SilentlyContinue"
$i = 0
$currentLocation = Convert-Path .
$programTxtLocation = $currentLocation + "\programs.txt"
$text = Get-Content -Path $programTxtLocation
$one = 1
$i2 = 0

function Pause
{
	Read-Host 'Press Enter once the Program has been installed'| Out-Null
}

md C:\tmp
cd C:\tmp
while($i -lt $text.Count){ 
$url = $text[$i]
if($url -Like '*.msi'){
$output = "program" + $i + ".msi"
Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "Sucessfully Downloaded Program"
cd C:\tmp
$programName = "c:\tmp\" + $output
msiexec /I $programName
Pause
}
else{
$output = "program" + $i + ".exe"
Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "Successfully Downloaded Program" 
cd C:\tmp
$programName = ".\program" + $i + ".exe"
Invoke-Expression $programName
Pause
}
if(-NOT ($i2 -eq 1)){
$i2 = $i2 + $one
}
else{
$i = $i + $one
}
}
cd $currentLocation
Remove-Item -path c:\tmp -recurse
Write-Output "Program Installations Complete"
