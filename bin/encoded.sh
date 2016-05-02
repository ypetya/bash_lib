#!/bin/bash
dec(){
echo "To decode :  $1 "
}
while read line ; do
  if [ ! -z $enc ] ; then
    dec $line
  fi
  [ -z $enc ] && [ "${line:0:2}" = '#-' ] && enc=1 
done < $0
exit 0
#-
oppa
gangnam style
menthos bashing full of life
nehogy ketseg bash
