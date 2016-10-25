# input : multiple patterns to match
# this tool should help you remove the matching changes from index
# by
# 1) give the user one choice per match
# 2) assist through the workflow:
#  A. checking out the unstaged version of the index element
#  B. reset the change to the repository version ( remove unknown file )
import set_separator
import user.ask
import string.match

function git.reset_files() {
  if [[ $# < 1 ]] ; then
    echo "You did not specify any pattern to match!"
    return 1
  fi

  set_separator
  
  local changes=( "$( git status --porcelain )" )
  local mod file

  for change in ${changes[@]} ; do
    change=$( echo $change | sed -r "s/^[[:space:]]+//" )
    mod=$( echo "$change" | cut -d ' ' -f 1 )
    file=$( echo "$change" | cut -d ' ' -f 2 )
  
    #print.vars change mod file

    if git.reset_files.match "$file" "$@" ; then
      if user.ask "Do you want to reset $file?" ; then
        if [[ "$mod" == "??" ]] ; then
          rm -v $file
        else
          echo "git checkout -- $file"
          git checkout -- $file
        fi
      fi
    fi

  done

  reset_separator
}

function git.reset_files.match() {
  local file_name="$1"
  local args=("$@")

  for i in $(seq 1 ${#args[@]}) ; do
    if string.match "$file_name" "${args[$i]}" ; then
      return 0
    fi
  done
  return 1
}
