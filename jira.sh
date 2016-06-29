#!/bin/bash

import chrome
import user.load_config

function jira() {
	local ticket_id="${1?param missing ticket_id}"
	user.load_config
	chrome open "${jira_url/%ticket_id/$ticket_id}"
}
