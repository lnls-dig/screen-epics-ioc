#!/bin/sh

# Use defaults if not set
if [ -z "${SCREEN_DEVICE_TELNET_PORT}" ]; then
   SCREEN_DEVICE_TELNET_PORT=20000
fi

# Run run*.sh scripts with procServ
/usr/local/bin/procServ -f -n screen${SCREEN_INSTANCE} -i ^C^D ${SCREEN_DEVICE_TELNET_PORT} ./runScreen.sh "$@"
