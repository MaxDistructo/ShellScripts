md C:\tmp
$i = 0
$urlArray = "http://www.7-zip.org/a/7z1801-x64.exe","https://stubdownloader.cdn.mozilla.net/builds/firefox-stub/en-US/win/8cfa56b0b4b4976670240aba0a71db342a748e760fdd498f42ad9d529202bd25/Firefox%20Installer.exe"
$one = 1

while($i -lt $urlArray.Count){ 
$url = $urlArray[$i]
Write-Output $url
$output = "program" + $i + ".exe"
Invoke-WebRequest -Uri $url -OutFile $output
Write-Output "Successfully Downloaded Program" 
cd C:\tmp
$programName = ".\program" + $i + ".exe"
Invoke-Expression $programName
$i = $i + $one
}
Write-Output "Program Installations Complete"