#!/bin/bash

# list all the commands availabe for require
function list() {
  get_source_dir DIR
  find $DIR -iname '*.sh' | sed 's|'$DIR'/||' | sed 's|.sh$||'
}
