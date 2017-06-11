#!/bin/bash

NOOP=""
SUDO="sudo "
NO_RUN=""
DEBUG=""
INSTALL_PATH=${INSTALL_PATH:-"$HOME/dev/puppet"}
while [ "$#" -gt 0 ]; do
    case "$1" in
        "--no-run")
            NO_RUN="true"
            ;;
        "--debug")
            DEBUG="true"
            ;;
        "--noop")
            NOOP="--noop"
            ;;
        "--sudo")
            SUDO="sudo "
            ;;
        "--no-sudo")
            SUDO=""
            ;;
        "--install-path")
            shift
            INSTALL_PATH="$1"
            ;;
    esac
    shift
done

red=`tput setaf 1`
green=`tput setaf 2`
reset=`tput sgr0`

function install {
    [ -z "$DEBUG" ] && echo -n "${green}$1..."
    shift
    if [ -n "$DEBUG" ]; then
        echo ">>> Running $@"
        $@ || exit 1
    else
        $@ 2>/dev/null >/dev/null || exit 1
    fi
    return=$?

    [ -z "$DEBUG" ] && echo " done${reset}"

    return $return
}
