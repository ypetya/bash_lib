#!/bin/bash

DEBUG=${DEBUG:=1}
function debug() {
  [[ "$DEBUG" == "1" ]] && echo "-----> $*" 1>&2
}
