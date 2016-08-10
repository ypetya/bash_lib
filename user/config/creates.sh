import user.ask
import print.print
import file.find_first
import is_mingw
import require_package

function user.config.creates() {
	# TODO comments in the config file -> questions
	# TODO store filename into a var

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

	user.ask "jira_dashboard url?" jira_dashboard_url
	echo "jira_dashboard_url=\"$jira_dashboard_url\"" >> ~/.user_config

	user.ask "jira_url (including string ticket_id)?" jira_url
	echo "jira_url=\"$jira_url\"" >> ~/.user_config

	user.ask "intellij idea unix-path?" idea_exe
	echo "idea_exe=\"$idea_exe\"" >> ~/.user_config

}
