# https://en.wikipedia.org/wiki/Web_Proxy_Autodiscovery_Protocol
# TODO this script should discover locations in order :
# http://wpad.department.branch.example.com/wpad.dat
# http://wpad.branch.example.com/wpad.dat
# http://wpad.example.com/wpad.dat
# http://wpad.com/wpad.dat
#
# you can get info on a windows by:
# $ echo $USERDOMAIN
# $ echo $USERDNSDOMAIN
# $ systeminfo
# http://superuser.com
# /questions/346372/how-do-i-know-what-proxy-server-im-using
import ask_user http.get
function find_proxies() {
  local a_proxy_url
  ask_user 'Please enter the HTTP auto proxy url to check? \
(http://my-domain-auto-proxy-lookup/proxies.js) :' a_proxy_url
  PROXIES=( \
	$( http.get $a_proxy_url | \
		perl -ne 'if(/PROXY ([^";]*)/g){ print "$1\n";}' \
		))
  for proxy in ${PROXIES[*]} ; do
    if http.get -x $proxy https://github.com &> /dev/null ; then
      echo "$proxy : OK"
    else
      echo "$proxy : not working $?"
    fi
  done
}
