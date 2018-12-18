#!/bin/bash

#installs python2

pythonScriptURL="https://www.dropbox.com/s/p20uwpxf41y484w/processcommunicator.py?dl=1"

if [ $TERM_PROGRAM = "Apple_Terminal" ]; #MacOS check
then #Assume MacOS
	curl $pythonScriptURL -o processcommunicator.py
	python2 processcommunicator.py
	fi
else #Assume Linux Distro
	sudo apt-get update
	sudo apt-get install python
	curl $pythonScriptURL -o processcommunicator.py
	python2 processcommunicator.py
	fi
 
