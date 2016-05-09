#!/bin/bash

function keep_only_last_N_files() {
  local LIMIT=$1
  set +f
  local FILES=($( ls ${OUTPUT_DIR}$OUTPUT_FILE* | sort))
  
  while [ ${#FILES[@]} -gt $LIMIT ] ; do
    rm -v ${FILES[0]}
    FILES=($( ls ${OUTPUT_DIR}$OUTPUT_FILE* | sort))
  done
 }
