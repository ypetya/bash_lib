#!/bin/bash

function ln() {
  echo "WARNING! 'ln' is an unsupported command on this platform."
  echo " * The following command was called:"
  echo "ln $@"

  if [ $1 = "-s" ] ; then
    echo " * Trying to translate it to a simple copy command : "
    COMMAND="cp -R $2 $3"
    echo "$COMMAND"
    if [ -d $3 ] ; then
      echo "Destenation directory already exists! command may fail!"
    fi 
    echo "Continue? Y/n"
    read -r "CONTINUE"
    if [ $CONTINUE = "n" ] ; then 
      echo "Returning with code : 1"
      return 1
    fi
    $COMMAND
    return $?
  else
    echo "Only -s option is supported"
    echo "Returning with code : 1"
    return 1
  fi
}
