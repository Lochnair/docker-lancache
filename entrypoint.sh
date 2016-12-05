#!/bin/sh

handle_signal () {
    PID=$!
    echo "Received signal. PID is ${PID}"
    kill -s SIGHUP $PID
}

trap "handle_signal" SIGINT SIGTERM SIGHUP

USER="nginx"
GROUP="nginx"
PGID="${PGID:-101}"
PUID="${PUID:-100}"

# Check if group and user ID matches
if [ $(id -u $USER) != $PUID ] || [ $(id -g $GROUP) != $PGID ]; then
    usermod -u $PUID $USER
    groupmod -g $PGID $GROUP
fi

"$@" & wait
