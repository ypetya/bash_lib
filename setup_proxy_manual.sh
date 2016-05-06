#!/bin/bash

import ask_user

# setup proxy server variables for curl, nodejs and git
# ask user input, when no parameters defined
function setup_proxy_manual() {
	local host="$1"
	local PROXY_PORT="$2"
	
	local password
	echo "Please enter password for user $USER :"
	read -rs password
	
	if [ -z "$host" ] ; then
		ask_user "Please enter proxy host :" host
	fi
	
	if [ -z "$PROXY_PORT" ] ; then
		ask_user "Please enter proxy port :" PROXY_PORT
	fi
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
	  # java
	  export JAVA_OPTS="-Dhttp.proxyHost=$PROXY_SERVER -Dhttp.proxyPort=$PROXY_PORT"
	fi
}
