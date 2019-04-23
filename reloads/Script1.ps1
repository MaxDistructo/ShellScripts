# Script1 
# Tasks:
# Download urls.json
# Install Adobe and Chrome
# Detect if OEM Machine and Install Appropriate Update Util
# Download Script2 and launch into it.

cd C:\tmp
wget https://raw.githubusercontent.com/MaxDistructo/ShellScripts/master/urls.json -outfile urls.json
$urlsjsonfile = Get-Content urls.json # Read urls.json
$urlsjson = $urlsjsonfile | ConvertFrom-Json # Convert to PSCustomObject containing JSON information
$urls = [$urlsjson.adobe, $urlsjson.chrome]
$ii = 0
foreach ($i in $urls)
  {
    wget $i -outfile "installer" + $ii + ".exe"
  }

  
