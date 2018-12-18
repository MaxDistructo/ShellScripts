#!/bin/bash

#installs python2

pythonScriptURL="https://raw.githubusercontent.com/MaxDistructo/ShellScripts/master/processcommunicator.py"

if [ "$TERM_PROGRAM" = "Apple_Terminal" ]; #MacOS check
then #Assume MacOS
	curl $pythonScriptURL -o processcommunicator.py
	python2 processcommunicator.py
else #Assume Linux Distro
	sudo apt-get update
	sudo apt-get install python
	curl $pythonScriptURL -o processcommunicator.py
	python2 processcommunicator.py
	fi
 
