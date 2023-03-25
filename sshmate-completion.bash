#!/bin/env bash
DELIMITER="|"
SSHMATE_FILE_PATH=$(sshmate -p)
_sshmate_completion_function() {
    connections=()
    while read -r line; do
        connections+=("$line")
    done < <(cut -d "$DELIMITER" -f 1 "${SSHMATE_FILE_PATH}")
    COMPREPLY=($(compgen -W "${connections[*]}" -- "${COMP_WORDS[COMP_CWORD]}"))
}
complete -F _sshmate_completion_function sshmate