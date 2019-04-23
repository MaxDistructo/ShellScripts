echo off
del C:\tmp /q
mkdir C:\tmp
cd C:\tmp
powershell.exe wget https://raw.githubusercontent.com/MaxDistructo/ShellScripts/master/reloads/Script1.ps1 -outfile Script1.ps1
powershell.exe -executionpolicy bypass -file ./Script1.ps1
