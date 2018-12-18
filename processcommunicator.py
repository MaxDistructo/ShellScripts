import platform
from distutils.spawn import find_executable
import urllib2
from subprocess import call

javaInstallerMacOS = "https://www.dropbox.com/s/tbt0klckirvwrke/jre-8u191-macosx-x64.dmg?dl=1"  #URL of MacOS Java Installer
aptRepositoryOracleJava = "ppa:webupd8team/java"  #URL of Linux Oracle Java Repo
jarLocation = "https://www.dropbox.com/s/rjxyod0v33od7m6/processcomunicator.jar?dl=1"
osType = platform.platform(True, False)

print "Process Communicator - Configuration Wizard"
print ""

javaPath = find_executable('java')
ip = "192.168.1.60"

if "Darwin" in osType:  #If OS is MacOS, run the following code.
    print "Checking for Java"
    if javaPath is None:
        print "Java Not Found"
        print "Installing Oracle Java"
        with open('javaInstaller.dmg', 'wb') as f:  #Downloads Java DMG to same directory as script
            f.write(urllib2.urlopen(javaInstallerMacOS).read())
            f.close()
        call('sudo hdiutil attach javaInstaller.dmg', shell=True)
        call('sudo installer -pkg /Volumes/Java\\ 8\\ Update\\ '
             '191/Java\\ 8\\ Update\\ 191.app/Contents/Resources/JavaAppletPlugin.pkg -target /')
        call('sudo hdiutil unmount /Volumes/javaInstaller/', shell=True)
        call('rm javaInstaller.dmg', shell=True)
if "Linux" in osType:
    print "Attempting to Install Oracle Java"
    call('sudo add-apt-repository ' + aptRepositoryOracleJava + ' -y', shell=True)  #Always attempt to install Oracle Java as Linux users usually use OpenJDK which does not have libs for JavaFX
    call('sudo apt-get update', shell=True)
    call('sudo apt-get install oracle-java8-installer -y', shell=True)
with open('processcomunicator.jar', 'wb') as f:
    f.write(urllib2.urlopen(jarLocation).read())
    f.close()
    userinput = raw_input('Input the IP of the Process Communicator Server. If you do not have one, just hit enter.')
    if userinput is None:
        call('java -jar processcomunicator.jar l --ip ' + ip, shell=True)
    else:
        call('java -jar processcomunicator.jar l --ip ' + userinput, shell=True)
