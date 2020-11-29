echo off
del tmp /q
mkdir tmp
cd C:\tmp
powershell.exe wget URLToFile -outfile script.ps1
powershell.exe -executionpolicy bypass -file ./script.ps1
cd ..
del tmp /q
