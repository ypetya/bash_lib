#!/bin/bash

import convert_filename_to_package
# list all the commands availabe for require
function list() {
  get_source_dir DIR
  find $DIR -iname '*.sh' | convert_filename_to_package $DIR
}
