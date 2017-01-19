import first
import print.print

function npm.fetch_artifact_version() {
    local artifact_name="${1? param missing - artifact or more artifacts name can be given here}"
    while (( $# > 0 )) ; do
	artifact_name="$1"
	print "$artifact_name most recent version : "
	npm show "$artifact_name" version | first
	npm ls "$artifact_name"
	shift
    done
}
