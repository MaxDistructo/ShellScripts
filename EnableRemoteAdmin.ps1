Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value '*'
$url = "https://raw.githubusercontent.com/MaxDistructo/ShellScripts/master/Comic%20Sans%20MS.reg"
$output = "c:\ComicSansMS.reg"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)
reg.exe import C:\ComicSansMS.reg
Restart-Computer -Force
