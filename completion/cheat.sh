import require_package

if require_package cheat ; then
  function completion.cheat()
  {
      local cur=${COMP_WORDS[COMP_CWORD]}
      CHEAT_COMPLETE=( $(ls -1 $CHEAT $CHEAT/errtheblog/ | \
		grep .md | \
		sort -u | cut -f1 -d'.' ) )
      COMPREPLY=( $(compgen -W "${CHEAT_COMPLETE[*]}" -- $cur) )
  }
  complete -F completion.cheat ch
  complete -F completion.cheat cheat
fi
