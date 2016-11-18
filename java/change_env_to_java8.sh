import java.get_env
import path.remove
import path.add

function java.change_env_to_java8() {
	echo "Original java settings:"
	java.get_env

	path.remove "${JAVA_7_HOME? missing variable JAVA_7_HOME}"
	path.add "${JAVA_8_HOME? missing variable JAVA_8_HOME}"

	export JAVA_HOME="$JAVA_8_HOME"
	echo "New java settings:"
	java.get_env
}
