import print.print
# Call this function with
# \$1=username, \$2=server \$3=.\[key filename defaults to id_rsa]\
# This will setup your <\$3|id_rsa>.pub onto ~/.ssh/authorized_keys"

function ssh.setup_public_key() {
  local user="${1? - param missing user}"
  local server="${2? - param missing server}"
  local key="${3:id_rsa}"

  print 'Setup...\n'
  if cat ~/.ssh/${3:-id_rsa}.pub |
    ssh $1@$2 \
'mkdir ~/.ssh; touch ~/.ssh/authorized_keys; chmod a=,u=Xrw -R ~/.ssh; \
cat - >> ~/.ssh/authorized_keys'
  then
    print green 'Successful\n'
  else
    print red 'Failed\n'
  fi
}
