import npm.project.get_script_list

function completion.npm() {
  local cur=${COMP_WORDS[COMP_CWORD]}
  REQUIRE_COMPLETE=( $( npm.project.get_script_list ) )
  COMPREPLY=( $(compgen -W "${REQUIRE_COMPLETE[*]}" -- $cur) )
}
complete -F completion.npm npm
