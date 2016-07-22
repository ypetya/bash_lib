function java.find_jar_on_classpath() {
  local PATH_ELEMENTS=(${PATH//:/\" \"});
  for elem in "${PATH_ELEMENTS[@]}"; do
    echo $elem
  done
}
