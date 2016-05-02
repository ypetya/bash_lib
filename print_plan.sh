#!/bin/bash

function print_plan() {
	if [ -f "$HOME/.plan" ]; then
	  cat $HOME/.plan
	fi
}
