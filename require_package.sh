#!/bin/bash

function require_package() {
  UNAME="$(uname)"
  case $UNAME in
    MINGW*)
	  # TODO add existing mingw tools here
      return 0
      ;;
    Linux)
      echo "require $1"
      if ! type -t $1 2>&1 >> /dev/null ; then
        echo "$1 not installed yet!"
        sudo apt-get install $1
        return $?
      fi
      ;;
  esac
}
