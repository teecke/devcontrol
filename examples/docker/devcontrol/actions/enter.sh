#!/bin/bash

# @description Access to a container console using bash
#
# @example
#   enter web
#
# @arg $1 Task: "brief", "help" or "exec"
# @arg $2 Service: "web", "app" or "duing"
#
# @exitcode The exit status of the `docker-compose exec bash` command
#
# @stdout "Not implemented" message if the requested task is not implemented
#
function enter() {

    # Init
    local briefMessage="Enter with a console to a service: 'app' (default), 'db' or 'duing'"
    local helpMessage="""Use 'docker-compose' to exec a bash terminal in a service"""

    # Task choosing
    case $1 in
        brief)
            showBriefMessage ${FUNCNAME[0]} "$briefMessage"
            ;;
        help)
            showHelpMessage ${FUNCNAME[0]} "$helpMessage"
            ;;
        exec)
            service=$2
            docker-compose exec ${service} bash
            ;;
        *)
            showNotImplemtedMessage ${FUNCNAME[0]} $1
            return 1
    esac
}

# Main
enter "$@"