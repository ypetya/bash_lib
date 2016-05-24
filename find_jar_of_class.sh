#!/bin/bash

import set_separator
# this function helps you to find a jar file for the class
function find_jar_of_class() {
  set_separator

  jars=( $( find -type f -name "*.jar" ) )
  for i in ${jars[*]} ; do
    if [ ! -z "$(jar -tvf "$i" | grep -Hsi $1)" ] ; then
      echo "$i"
    fi
  done

  reset_separator
}
