#!/bin/bash

# call this with zero, one or two parameters. 
# $1 = Artist,
# $2 = track
# stores ~/.fav file in format : Artist : Track. example:
# Midlake:Roscoe
function fav() {
  local fav_file="$HOME/.favs"
  if [ ! -f $fav_file ] ; then
    echo "Creating favs file : $fav_file"
    echo "Artist : Track" > "$fav_file"
  fi
  if [ -z "$1" ] ; then
    echo "Artist?"
    read -r artist
  else
    artist=$1
  fi
  if [ -z "$2" ] ; then
    echo "Track?"
    read -r track
  else
    track=$2
  fi
  
  echo "$artist : $track" >> "$fav_file"
}
