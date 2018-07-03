
function npm.do(){
    PATH=$(npm bin):$PATH
    eval $@
}