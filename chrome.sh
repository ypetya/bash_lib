import user.config.load
import print.error
import string.is_empty

function chrome() {
  local mode="${1?param missing - mode : dev|secure|incognito|inbox|gmail|open|help}"
  user.config.load
  local command="$chrome_exe "
  while (( $# > 0 )) ; do
    mode="$1"
    case $mode in
      dev)
        mode="--disable-web-security --user-data-dir"
        ;;
      secure)
        if string.is_empty "$http_proxy" ; then
          error "No proxy defined in \$http_proxy"
          return 1
        else
          mode="--proxy-server=$http_proxy"
        fi
        ;;
      incognito)
        mode="--incognito"
        ;;
      inbox)
        mode="http://inbox.google.com"
        ;;
      gmail)
        mode="http://gmail.com"
        ;;
      open)
        mode=""
        ;;
      help)
        echo "try passing arguments dev|secure|incognito|inbox|gmail|open|help"
        return 1
        ;;
    esac

    command="$command $mode"
    shift
  done
  eval $command
}
