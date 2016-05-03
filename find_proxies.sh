#!/bin/bash

# https://en.wikipedia.org/wiki/Web_Proxy_Autodiscovery_Protocol
# TODO this script should discover locations in order :
# http://wpad.department.branch.example.com/wpad.dat
# http://wpad.branch.example.com/wpad.dat
# http://wpad.example.com/wpad.dat
# http://wpad.com/wpad.dat
#
# you can get info on a windows by:
# $ echo $USERDOMAIN
# BUDAPEST
# $ echo $USERDNSDOMAIN
# BUDAPEST.EPAM.COM
# $ systeminfo
# http://superuser.com/questions/346372/how-do-i-know-what-proxy-server-im-using/346376#346376
#
function find_proxies() {
  read -rp 'Please enter the HTTP auto proxy url to check? (http://my-domain-auto-proxy-lookup/proxies.js) :' a_proxy_url 
  PROXIES=( $(curl $a_proxy_url 2>/dev/null | perl -ne 'if(/PROXY ([^";]*)/g){ print "$1\n";}'))
  for proxy in ${PROXIES[*]} ; do
    if "curl" -s -x $proxy --connect-timeout 5 https://github.com &> /dev/null ; then
      echo "$proxy : OK"
    else
      echo "$proxy : not working $?"
    fi
  done
}
