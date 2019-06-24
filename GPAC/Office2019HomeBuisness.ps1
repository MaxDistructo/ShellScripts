\\192.168.175.11\Installs\GPAC\setup.exe /configure \\192.168.175.11\Installs\GPAC\GPAC.xml
msiexec /I \\192.168.175.11\Installs\GPAC\Agent_Install.msi
Invoke-Expression \\192.168.175.11\Installs\GPAC\readerdc_en_xa_crd_install.exe
msiexec /I \\192.168.175.11\Installs\GPAC\RingCentral-19.05.2-x64.msi
