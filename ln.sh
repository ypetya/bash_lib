import print.print
import is_mingw user.ask print

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
		if user.ask 'Continue?' ; then
			$COMMAND
			return $?
		fi
	  else
		print "Only -s option is supported"
	  fi

	  return 1
	}

fi
