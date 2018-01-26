# Get the ID and security principal of the current user account
$myWindowsID = [System.Security.Principal.WindowsIdentity]::GetCurrent();
$myWindowsPrincipal = New-Object System.Security.Principal.WindowsPrincipal($myWindowsID);

# Get the security principal for the administrator role
$adminRole = [System.Security.Principal.WindowsBuiltInRole]::Administrator;

# Check to see if we are currently running as an administrator
if ($myWindowsPrincipal.IsInRole($adminRole))
{
    # We are running as an administrator, so change the title and background colour to indicate this
    $Host.UI.RawUI.WindowTitle = $myInvocation.MyCommand.Definition + "(Elevated)";
    $Host.UI.RawUI.BackgroundColor = "DarkBlue";
    Clear-Host;
}
else {
    # We are not running as an administrator, so relaunch as administrator

    # Create a new process object that starts PowerShell
    $newProcess = New-Object System.Diagnostics.ProcessStartInfo "PowerShell";

    # Specify the current script path and name as a parameter with added scope and support for scripts with spaces in it's path
    $newProcess.Arguments = "& '" + $script:MyInvocation.MyCommand.Path + "'"

    # Indicate that the process should be elevated
    $newProcess.Verb = "runas";

    # Start the new process
    [System.Diagnostics.Process]::Start($newProcess);

    # Exit from the current, unelevated, process
    Exit;
}
Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value '172.18.*.*' -Concatenate -AllowRemoteShellAccess true #Set Bessie to be a trusted host.
Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value '' -Concatenate -AllowRemoteShellAccess true #Set any lan computer to be a trusted host 
$url = "https://raw.githubusercontent.com/MaxDistructo/ShellScripts/master/Comic%20Sans%20MS.reg"
$output = "c:\ComicSansMS.reg"
$wc = New-Object System.Net.WebClient
$wc.DownloadFile($url, $output)
reg.exe import C:\ComicSansMS.reg
Restart-Computer -Force
