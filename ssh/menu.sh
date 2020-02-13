import ssh.create_key
import ssh.choose_key


function ssh.menu() {

	local hosts=( $(cat ~/.ssh/config | grep 'Host ' | cut -d ' ' -f 2) )
	local commands=( Quit CreateKey CopyKeyToClipboard )

	for host in "${hosts[@]}" ; do
		commands=( "${commands[@]}" $host "Upgrade $host" "pm2 l $host" "key-> $host" )
	done
	select command in "${commands[@]}" ; do
		case "$command" in
			Quit)
				return 0
				;;
			CreateKey)
				ssh.create_key
				;;
			CopyKeyToClipboard)
				ssh.copy_public_key
				;;
			'key-> '*)
				local key=$( ssh.choose_key )
				cat ~/.ssh/${key}.pub | ssh ${command:6} \
				'mkdir ~/.ssh; touch ~/.ssh/authorized_keys;\
			       	chmod a=,u=Xrw -R ~/.ssh; \
				cat - >> ~/.ssh/authorized_keys'
				;;
			'pm2 l '*)
				echo 'pm2 list; exit 0' | ssh "${command:6}" -tt
				;;
			'Upgrade '*)
				ssh "${command:8}" -tt 'sudo apt-get update && sudo apt-get upgrade'
				;;
			*)
	       			ssh $command
		esac
	done
}

