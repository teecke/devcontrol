#!/bin/bash

# @description Show status of the docker platform
#
# @example
#   status
#
# @arg $1 Task: "brief", "help" or "exec"
#
# @exitcode The exit code of the `docker-compose ps` command
# @exitcode 1  If the task is not implemented
#
# @stdout "Not implemented" message if the requested task is not implemented
#
function status() {

    # Init
    local briefMessage="Get status of the local docker development environment"
    local helpMessage="Execute the 'docker-compose ps' command"

    # Task choosing
    case $1 in
        brief)
            showBriefMessage ${FUNCNAME[0]} "$briefMessage"
            ;;
        help)
            showHelpMessage ${FUNCNAME[0]} "$helpMessage"
            ;;
        exec)
            docker-compose ps
            ;;
        *)
            showNotImplemtedMessage ${FUNCNAME[0]} $1
            return 1
    esac
}

# Main
status "$@"