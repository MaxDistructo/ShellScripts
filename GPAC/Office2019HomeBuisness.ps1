function Pause
{
	Read-Host 'Press Enter once the Program has been installed'| Out-Null
}
\\192.168.175.11\Installs\GPAC\setup.exe /configure \\192.168.175.11\Installs\GPAC\GPAC.xml
Pause
msiexec /I \\192.168.175.11\Installs\GPAC\Agent_Install.msi
Pause
Invoke-Expression \\192.168.175.11\Installs\GPAC\readerdc_en_xa_crd_install.exe
Pause
msiexec /I \\192.168.175.11\Installs\GPAC\RingCentral-19.05.2-x64.msi
