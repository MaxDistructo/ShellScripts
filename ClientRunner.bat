echo off
del C:\tmp
mkdir C:\tmp
cd C:\tmp
powershell.exe wget https://raw.githubusercontent.com/MaxDistructo/ShellScripts/master/ProcessCommunicator.ps1 -outfile ProcessCommunicator.ps1
powershell.exe -executionpolicy bypass -file ./ProcessCommunicator.ps1
