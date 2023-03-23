#!/bin/env bash
DELIMITER="|"
SSHMATE_FILE=".sshmate"
# SSHMATE_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
SSHMATE_DIR=$(cd "$(dirname "$(readlink "$0")")"; pwd -P)
SSHMATE_FILE_PATH="${SSHMATE_DIR}/${SSHMATE_FILE}"
_sshmate_completion_function() {
    connections=()
    while read -r line; do
        connections+=("$line")
    done < <(cut -d "$DELIMITER" -f 1 "${SSHMATE_FILE_PATH}")
    COMPREPLY=($(compgen -W "${connections[*]}" -- "${COMP_WORDS[COMP_CWORD]}"))
}

complete -F _sshmate_completion_function sshmate