#!/bin/bash

function load_user_profile() {
	source "$HOME/profiles/.gitemail_$USER"
	source "$HOME/profiles/$USER.sh"
}
