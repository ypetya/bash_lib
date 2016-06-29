#!/bin/bash

function user.load_profile() {
	source "$HOME/profiles/.gitemail_$USER"
	source "$HOME/profiles/$USER.sh"
}
