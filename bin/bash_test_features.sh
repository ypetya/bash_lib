#!/bin/bash

# return value into variable - injected output
function return_into() {
  local ret_var="$1";
  # some calculation
  local var='value'
  eval "$ret_var='$var'"
}

function create_map() {
  declare -A $1
}

function create_week_days() {
  create_map week

  week[1]='Mon'
  week[2]='Tue'
  week[3]='Wed'
  week[4]='Thu'
  week[5]='Fri'
  week[6]='Sat'
  week[7]='Sun'

  print_map week
}

function print_map() {
  eval "input=$"$1""

  echo "keys : ${!input[@]}"
  echo "values : ${input[@]}"
}
