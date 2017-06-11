#!/bin/bash

NOOP=""
SUDO="sudo env PATH=$PATH "
NO_RUN=""
DEBUG=""
SKIP_BUNDLER=""
SKIP_LIBRARIAN=""
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
            SUDO="sudo env PATH=$PATH "
            ;;
        "--no-sudo")
            SUDO=""
            ;;
        "--skip-bundler")
            SKIP_BUNDLER="true"
            ;;
        "--skip-librarian")
            SKIP_LIBRARIAN="true"
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
