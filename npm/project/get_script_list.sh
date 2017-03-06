# returns a list of the defined scripts in a package.json
function npm.project.get_script_list () {
    npm run | sed -n '1d;p;n'
}