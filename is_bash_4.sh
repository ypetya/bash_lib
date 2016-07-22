function is_bash_4() {
  if (( $BASH_VERSINFO >= 4 )) ; then
    return 0
  fi

  return 1
}
