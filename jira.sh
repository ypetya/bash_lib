#!/bin/bash

import chrome
import user.load_config
import string.is_empty

function jira() {
	local ticket_id="$1"
	user.load_config
	if string.is_empty "$ticket_id" ; then
		chrome open "${jira_dashboard_url}"
	else
		chrome open "${jira_url/%ticket_id/$ticket_id}"
	fi
}
