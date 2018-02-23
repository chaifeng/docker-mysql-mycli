#!/bin/bash
[[ -n "${DEBUG:-}" ]] && set -x
set -eu -o pipefail

declare -a MYCLI_OPTS=()

if [[ -n "${MYSQL_ROOT_PASSWORD:-}" ]]; then
    MYSQL_USER=root
    MYSQL_PASSWORD="$MYSQL_ROOT_PASSWORD"
fi

[[ -n "${MYSQL_HOST:-}" ]] && MYCLI_OPTS+=(--host "$MYSQL_HOST")
[[ -n "${MYSQL_USER:-}" ]] && MYCLI_OPTS+=(--user "$MYSQL_USER")
[[ -n "${MYSQL_PASSWORD:-}" ]] && MYCLI_OPTS+=(--password "$MYSQL_PASSWORD")
[[ -n "${MYSQL_DATABASE:-}" ]] && MYCLI_OPTS+=("$MYSQL_DATABASE")

if [[ -x "$1" ]]; then
    exec "$@"
else
    [[ "${1:-}" = "mycli" ]] && shift
    [[ 0 -lt "$#" ]] && MYCLI_OPTS+=("$@")
    [[ 0 -eq "${#MYCLI_OPTS[@]}" ]] && MYCLI_OPTS=(--help)
    exec /usr/local/bin/mycli "${MYCLI_OPTS[@]}"
fi
