#!/bin/bash
# set -x

~/bash_lib/require.sh
import run_job create_map lint_fix

function main() {
	case $1 in
		dev|qa|uat) 
			execute_run $@
			;;
		lint)
			lint_fix
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


# Checking ci-build
function check_ci {
  if ! grunt ci-build ; then
    error ' * ci-build is failing'
    exit 1
  fi
}

function setup_jobs() {
	create_map JOBS
	
	JOBS[babel]='npm run-script babel-watch'
	JOBS[run]="run -e $ENV $DEPS"
	JOBS[css]="grunt compass:dev"
}

function check_and_run {
  local job="${JOBS[$1]}"
  run_job "$job"
}

function execute_run {
	ENV=$1

	if [ -z $2 ] ; then
	  DEPS="--deps dependencies.$USERNAME.json"
	else
	  DEPS="--deps $2"
	fi


	setup_jobs
	
	while true; do
	  for job in ${JOBS[@]} ; do
		check_and_run $job
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
