import print.print

export DEBUG=${DEBUG:=0}

function print.debug() {
  [[ "$DEBUG" == "1" ]] && print "$@\n" 1>&2
}

alias debug="print.debug"
