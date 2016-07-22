function is_mingw() {
  UNAME="$(uname)"
  if [ ${UNAME:0:5} == "MINGW" ] ; then
    return 0;
  fi
  return 1
}
