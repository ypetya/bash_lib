#!/bin/bash

function setup_proxy_manual() {
	local password
	local host
	local PROXY_PORT
	read -rsp "Please enter password for user $USER :" password
	read -rp "Please enter proxy host :" host
	read -rp "Please enter proxy port :" PROXY_PORT
	# --- proxy
	local PROXY_SERVER="http://$USER:$password@$host"
	if [ ! -z "$host" ] ; then
	  echo "Setting up proxy server ${PROXY_SERVER##*@}:$PROXY_PORT"
	  # curl
	  export PROXY_ARGS="-x $PROXY_SERVER:$PROXY_PORT"
	  # nodejs
	  export HTTP_PROXY="$PROXY_SERVER:$PROXY_PORT"
	  export HTTPS_PROXY="$PROXY_SERVER:$PROXY_PORT"
	  # git
	  export http_proxy="$PROXY_SERVER:$PROXY_PORT"
	  export https_proxy="$PROXY_SERVER:$PROXY_PORT"
	fi
}
