function is_cygwin() {
  local UNAME="$(uname)"
  if [ "${UNAME:0:6}" == 'CYGWIN' ] ; then
    return 0;
  fi
  return 1
}
