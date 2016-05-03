#!/bin/bash

source_relative list

function require_completion() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  REQUIRE_COMPLETE=( $( list ) )
  COMPREPLY=( $(compgen -W "${REQUIRE_COMPLETE[*]}" -- $cur) )
}
complete -F require_completion require
