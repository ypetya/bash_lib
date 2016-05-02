#!/bin/bash

function git_what_have_they_done() {
  if [ -e $1 ] ; then
    git blame $1 -e |  sed -r 's/([(<]+)(.*?)([@].*)/\2/' | sort | uniq -c | sort -r
  else
    echo "Please specify filename!"
  fi
}
