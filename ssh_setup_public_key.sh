function ssh_setup_public_key() {
  if [ $# -eq 2 ] ; then
    cat ~/.ssh/${3:-id_rsa}.pub | \
    ssh $1@$2 \
'mkdir ~/.ssh; touch ~/.ssh/authorized_keys; chmod a=,u=Xrw -R ~/.ssh; \
cat - >> ~/.ssh/authorized_keys'
  else
    echo "call this function with \$1=username, \$2=server \$3=.\
[key filename defaults to id_rsa]\
 This will setup your <\$3|id_rsa>.pub onto ~/.ssh/authorized_keys"
  fi
}
