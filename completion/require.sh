import list

function completion.require() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  REQUIRE_COMPLETE=( $( list ) )
  COMPREPLY=( $(compgen -W "${REQUIRE_COMPLETE[*]}" -- $cur) )
}
complete -F completion.require require
