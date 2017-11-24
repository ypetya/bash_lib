import user.config.load
import require_package

function fon_login() {
    require_package open
    local fon_login_url="$(
        curl -vs 172.217.18.78 2>&1 | 
        grep Location | 
        head -1 | 
        cut -d ' ' -f 3
    )"
    echo "open: $fon_login_url"
    open "$fon_login_url"
}
