#!/bin/bash

import is_mingw ask_user print

if is_mingw ; then

	function ln() {
	  print yellow "WARNING! 'ln' is an unsupported command on this platform."
	  print "ln $@"

	  if [ $1 = "-s" ] ; then
		echo " * Trying to translate it to a simple copy command : "
		COMMAND="cp -R $2 $3"
		echo "$COMMAND"
		if [ -d $3 ] ; then
		  print yellow "Destenation directory already exists! command may fail!"
		fi
		if ask_user 'Continue?' ; then
			$COMMAND
			return $?
		fi
	  else
		print "Only -s option is supported"
	  fi

	  return 1
	}

fi
