import chrome
import user.load_config
import string

function jira() {
	local ticket_id="$1"
	user.load_config

	if string.is_empty "$ticket_id" ; then
		chrome open "${jira_dashboard_url}"
	else
		if string.match_regex "$ticket_id" '^[0-9]+$' ; then
			ticket_id="${jira_project}-${ticket_id}"
		fi
		chrome open "${jira_url/%ticket_id/$ticket_id}"
	fi
}
