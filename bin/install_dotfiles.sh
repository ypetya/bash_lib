#!/bin/bash

# This will install dotfiles and things into the home interactive

REQUIREMENTS=( git curl vim )
REPO=https://bitbucket.org/kisp/dotfiles.git
VIMFILES_REPO=https://github.com/ypetya/vimfiles.git

# require source_relative - which can be used by any local script
DIR="${BASH_SOURCE%/*}"
if [[ ! -d "$DIR" ]]; then DIR="$PWD"; fi
source "$DIR/../source_relative.sh"

source_relative is_linux
source_relative require_package
source_relative ask_user

function check_requirements() {
	if is_linux ; then
	  for required in ${REQUIREMENTS[@]} ; do
		require_package $required
	  done
	fi
}

function clone(){
  # dotfiles
  if ask_user 'Would you like to install dotfiles?' ; then
    echo "cloning dotfiles"
    if [ ! -d tmp ] ; then
      git clone $REPO tmp
    else
      echo "The directory 'tmp' already exists. \
  Please remove this directory before continue!"
	  return 1
    fi
    cp -via tmp/. .
    rm tmp -rf
    git st
  fi

  # vimfiles
  if ask_user 'Would you like to install vimfiles?' ; then
    echo "cloning vimfiles"
    if [ ! -d .vim ] ; then
      DIR=vimfiles
      if is_linux ; then
        DIR=.vim
      fi
      git clone $VIMFILES_REPO $DIR
      pushd $DIR
      git submodule init
      git submodule update
      popd
    else
      echo "The directory '.vim' already exists \
    Please clone vimfiles repo manually or remove the directory!"
	  return 1
    fi
  fi

  # cheat
  if ask_user 'Would you like to install cheat sheets?' ; then
    if [ ! -d ~/.cheat ] ; then
      git clone https://github.com/ypetya/cheat.git ~/.cheat
      chmod +x ~/.cheat/cheat.sh
    fi
  fi
}


function main() {
  case "$1" in
		  init_repo)
			  git init && git remote add origin $REPO
			  ;;
          clone)
              clone
              ;;
          git)
              git gui &
              ;;
          *)
              echo $"Usage: $0 {init_repo|clone|git}"
              exit 1

  esac
}

check_requirements

main $@
