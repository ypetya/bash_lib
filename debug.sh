#!/bin/bash

# ${DEBUG:=1}
function debug() {
  [[ "$DEBUG" ]] && echo "-----> $*" 1>&2
}
