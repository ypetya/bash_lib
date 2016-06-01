#!/bin/bash

function print.plan() {
	if [ -f "$HOME/.plan" ]; then
	  cat $HOME/.plan
	fi
}
