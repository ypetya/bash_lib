#!/bin/bash


function ssh_completion() {
	SSH_COMPLETE=()
	if [ -f ~/.ssh/config ] ; then
	  SSH_COMPLETE=( ${SSH_COMPLETE[*]} \
	  $(grep "^Host " ~/.ssh/config | cut -f2 -d ' ' | sort -u ) )
	  SSH_COMPLETE=( ${SSH_COMPLETE[*]} \
	  $(grep "\w*User " ~/.ssh/config | cut -f2 -d ' ' | sort -u ) )
	fi
	if [ -f ~/.ssh/known_hosts ] ; then
	  SSH_COMPLETE=( ${SSH_COMPLETE[*]} \
	  $(cut -f1 -d' ' ~/.ssh/known_hosts | cut -f1 -d',' | sort -u ))
	fi
	complete -o default -W "${SSH_COMPLETE[*]}" ssh
	complete -o default -W "${SSH_COMPLETE[*]}" scp
}

ssh_completion
