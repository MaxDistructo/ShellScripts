wget "https://github.com/MaxDistructo/ShellScripts/raw/master/GPAC/setup.exe" -outfile "setup.exe"
wget "https://raw.githubusercontent.com/MaxDistructo/ShellScripts/master/GPAC/GPAC.xml" -outfile "GPAC.xml"
.\setup.exe /configure GPAC.xml
