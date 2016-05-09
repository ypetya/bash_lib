#!/bin/bash
# set -x

import run_job error

function main() {
	case $1 in
		dev|qa|uat) 
			execute_run $@
			;;
		lint)
			check_eslint
			;;
		ci) check_ci
			;;
		css) 
			check_and_run css
			;;
		git)
			if [[ $# == 1 ]] ; then
				git gui &
			elif [[ $2 == 'co' && $3 == 'develop' ]] ; then
				git stash
				git co develop
				git pull
				git stash pop
			else
				shift
				git $@
			fi
			;;
		grunt)
			shift
			grunt $@
			;;
		tdd) 
			check_and_run babel
			grunt tdd
			;;
		get_source_dirs)
			find source/ -type d
			;;
		update)
			npm update
			npm install
			;;
		install)
			shift
			npm install $@
			;;
		*)  print_usage $@
			;;
	esac
}

function print_usage {
	local prog=$(basename $0)
	cat << HELP
	
Usage examples
==============

$prog <dev|qa|uat> [dependencies.json path]
$prog ci
# run eslint and autmatic fixes:
$prog slint
$prog get_source_dirs

# npm update + npm install
$prog update 
$prog install <module>
HELP
}

# Checking and auto-fixing eslint issues
function check_eslint {
  if ! grunt eslint:dev ; then
    echo ' * eslint failed, executing eslint fix'
    npm run eslint-fix
    echo ' * Please review commit, stage changes and try again!'
    exit 1
  fi
}

# Checking ci-build
function check_ci {
  if ! grunt ci-build ; then
    error ' * ci-build is failing'
    exit 1
  fi
}


function check_and_run {
  case $1 in
    babel) run_job 'npm run-script babel-watch'
	;;
    run) run_job "run -e $ENV $DEPS"
    ;;
    css) run_job "grunt compass:dev"
    ;;
  esac
}

function execute_run {
	ENV=$1

	if [ -z $2 ] ; then
	  DEPS="--deps dependencies.$USERNAME.json"
	else
	  DEPS="--deps $2"
	fi
	
	local tasks=(babel css run)
	
	while true; do
	  for task in ${tasks[@]} ; do
		check_and_run $task
	  done	
	  sleep 3
	done
}

function on_start {
	START=$(date +%s)
	trap "on_exit" EXIT
}

function on_exit {	
	END=$(date +%s)
	DIFF=$( expr $END - $START )
	printf "\n * Done in $DIFF seconds\n"	
	exit 0
}

on_start
main $@
