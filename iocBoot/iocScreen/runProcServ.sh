#!/bin/sh

set -e
set +u

# Parse command-line options
. ./parseCMDOpts.sh "$@"

# Use defaults if not set
UNIX_SOCKET=""
if [ -z "${DEVICE_TELNET_PORT}" ]; then
    UNIX_SOCKET="true"
fi

if [ -z "${SCREEN_INSTANCE}" ]; then
   SCREEN_INSTANCE="1"
fi

set -u

# Run run*.sh scripts with procServ
if [ "${UNIX_SOCKET}" ]; then
    /usr/local/bin/procServ -f -n screen_${SCREEN_INSTANCE} -i ^C^D unix:./procserv.sock ./runScreen.sh "$@"
else
    /usr/local/bin/procServ -f -n screen_${SCREEN_INSTANCE} -i ^C^D ${DEVICE_TELNET_PORT} ./runScreen.sh "$@"
fi
