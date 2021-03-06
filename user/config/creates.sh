import user.ask
import print.print
import file.find_first
import is_mingw
import require_package

function user.config.creates() {
	# TODO automate question's source from comments in the config file
	# TODO store filename into a template variables

	user.ask "Please enter service_endpoint" service_endpoint
	echo "service_endpoint=\"$service_endpoint\"" > ~/.user_config
	user.ask "Please enter token" token
	echo "token=\"$token\"" >> ~/.user_config

	print "Searching for chrome..\n"
	if is_mingw ; then
		echo "chrome_exe=\"$(file.find_first /c/ chrome.exe |
			sed -r 's/ /\\ /g;s/([()])/\\\1/g' )\"" >> ~/.user_config
	else
		require_package chromium-browser
		echo "chrome_exe=\"$(which chromium-browser)\"" >> ~/.user_config
	fi

	user.ask "jira_dashboard url : url to open for command jira, without parameters?" jira_dashboard_url
	echo "jira_dashboard_url=\"$jira_dashboard_url\"" >> ~/.user_config

	user.ask "jira_url (including string ticket_id) : typical setup is : https://<jira_instance>/browse/ticket_id ?" jira_url
	echo "jira_url=\"$jira_url\"" >> ~/.user_config

	user.ask "jira_project (autocomplete jira number with <project prefix>-1234) ?" jira_project
	echo "jira_project=\"$jira_project\"" >> ~/.user_config

	user.ask "intellij idea unix-path?" idea_exe
	echo "idea_exe=\"$idea_exe\"" >> ~/.user_config

	user.ask "github.gist auth token?" github.gist.token
	echo "github.gist.token=\"${github.gist.token}\"" >> ~/.user_config

}
