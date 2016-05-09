#!/bin/bash

# return value into variable - injected output
function return_into() {
  local ret_var="$1";
  # some calculation
  local var='value'
  eval "$ret_var='$var'"
}


function create_map() {
  declare -gA $1
}

function examples() {
    
	# declare associative array
	declare -A assoc_array=(["key1"]="value1" ["key2"]="value2")
	# convert associative array to string
	assoc_array_string=$(declare -p assoc_array)
	# create new associative array from string
	eval "declare -A new_assoc_array="${assoc_array_string#*=}
	# show array definition
	declare -p new_assoc_array
}

# FIXME expr not available in mingw!
function cp_hash
{
    local original_hash_name="$1"
    local copy_hash_name="$2"

    local __copy__=$(declare -p $original_hash_name);
    eval declare -A __copy__="${__copy__:$(expr index "${__copy__}" =)}";

    for i in "${!__copy__[@]}"
    do
        eval ${copy_hash_name}[$i]=${__copy__[$i]}
    done
}

function create_week_days() {

  week[1]='Mon'
  week[2]='Tue'
  week[3]='Wed'
  week[4]='Thu'
  week[5]='Fri'
  week[6]='Sat'
  week[7]='Sun'

  print_map week
}

# FIXME not working
function print_map() {
  local map=$(declare -p "${1? param missing. [associative array]}")
  echo "keys : ${!map[@]}"
  echo "values : ${map[@]}"
}
