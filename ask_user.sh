#!/bin/bash

function ask_user() {
  local VAR

  case $# in
    1) # yes or no question
	  echo "$1 [Y]/n"
      read -r VAR
      if [ -z "$VAR" ] || [ 'y' == "$VAR" ] || [ 'Y' == "$VAR" ] ; then
        return 0
      fi
      ;;
    2) # output into var
	  echo "$1"
      read -r $2
      ;;
  esac

  return 1
}
