#!/bin/bash

# never_failing() || die 'it should not happen'
function die() {
  [ $# -gt 0 ] && echo "error: $@" >&2
  exit 1
}
