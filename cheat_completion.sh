#!/bin/bash

if require_package cheat ; then
  function cheat_completion()
  {
      local cur=${COMP_WORDS[COMP_CWORD]}
      CHEAT_COMPLETE=( $(ls -1 $CHEAT $CHEAT/errtheblog/ | \
		grep .md | \
		sort -u | cut -f1 -d'.' ) )
      COMPREPLY=( $(compgen -W "${CHEAT_COMPLETE[*]}" -- $cur) )
  }
  complete -F cheat_completion ch
  complete -F cheat_completion cheat
fi
