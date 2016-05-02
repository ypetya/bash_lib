#!/bin/bash

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
