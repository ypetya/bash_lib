#!/bin/bash

import print

export DEBUG=${DEBUG:=1}

function debug() {
  [[ "$DEBUG" == "1" ]] && print "$@\n" 1>&2
}
