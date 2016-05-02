#!/bin/bash


mvn_completion()
{
  local cur=${COMP_WORDS[COMP_CWORD]}
#  _get_comp_words_by_ref -n : cur

    MVN_COMMANDS=(
        'grails\:console'
        'grails:create-controller'
        'grails:create-domain-class'
        'grails:create-integration-test'
        'grails:create-pom'
        'grails:create-script'
        'grails:create-service'
        'grails:create-tag-lib'
        'grails:create-unit-test'
        'grails:exec'
        'grails:generate-all'
        'grails:generate-controller'
        'grails:generate-views'
        'grails:install-plugin'
        'grails:install-templates'
        'grails:list-plugins'
        'grails:package'
        'grails:run-app'
        'grails:run-app-https'
        'grails:uninstall-plugin'
        'clean'
        'install'
        'package'
        'deploy'
        'help:effective-pom'
        '-Dcommand=compile-gwt-modules'
        '-Dcommand=run-gwt-client'
        '-Dargs=8090'
        '-Dserver.port=8090'
        '-Dcommand=clean'
        '-Dcommand=compile'
        '-Dcommand=refresh-static-data'
        '-Dcommand=test-app'
        '-Dcommand=install-plugin'
        '-Dgrails.env=development'
        '-Dgrails.env=fx_development'
        '-Dgrails.env=fx_stable'
        '-Dcommand=integrate-with'
        '-e'
        '-Dargs=unit'
        '-Dargs=--eclipse'
        '-Dargs=--non-interactive'
        '-DskipTests'
        '-Dmaven.test.skip=true'
        '-Duser.home=C:\\DEV'
        )
 #   __ltrim_colon_completions "$cur"

    COMPREPLY=( $(compgen -W "${MVN_COMMANDS[*]}" -- $cur) )
}

complete -F mvn_completion mvn
COMP_WORDBREAKS=${COMP_WORDBREAKS//:}
COMP_WORDBREAKS=${COMP_WORDBREAKS//-}
COMP_WORDBREAKS=${COMP_WORDBREAKS//=}
