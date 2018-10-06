function ssh.copy_public_key() {
    require_package xsel
    cat ~/.ssh/id_rsa.pub | xsel -i -b
}