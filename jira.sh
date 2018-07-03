import chrome
import user.config.load
import string.is_empty string.match_regex

function jira() {
	local ticket_id="$1"
	user.config.load

	if string.is_empty "$ticket_id" ; then
		chrome open "${jira_dashboard_url}"
	else
		if string.match_regex "$ticket_id" '^[0-9]+$' ; then
			ticket_id="${jira_project}-${ticket_id}"
		fi
		chrome open "${jira_url/%ticket_id/$ticket_id}"
	fi
}
