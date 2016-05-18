#!/bin/bash

import print

export DEBUG=${DEBUG:=1}

function debug() {
  [[ "$DEBUG" == "1" ]] && print "-----> $*" 1>&2
}
