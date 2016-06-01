#!/bin/bash

# shortcut to use keytool app
# commands use help
#
# * default password is usually : changeit
# * default jdk path of keystore is : $JAVA_HOME/jre/lib/security/cacerts
#
# examples:
# java.keystore printcert -file <file>
# java.keystore help
# java.keystore list -help
function java.keystore() {
	local command="${1? param missing - command}"

	keytool -"$@" \
		-keystore $JAVA_HOME/jre/lib/securimty/cacerts \
		-storepass changeit
}
