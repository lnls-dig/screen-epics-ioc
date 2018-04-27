#!/bin/sh

set -e
set +u

# Source environment
. ./checkEnv.sh

# Parse command-line options
. ./parseCMDOpts.sh "$@"

# Check last command return status
if [ $? -ne 0 ]; then
        echo "Could not parse command-line options" >&2
        exit 1
fi

if [ -z "$EPICS_CA_MAX_ARRAY_BYTES" ]; then
    EPICS_CA_MAX_ARRAY_BYTES="50000000"
fi

if [ -z "$MTR_CTRL_PREFIX" ]; then
    echo "Motor controller prefix not set. Please use the -m option or set \$MTR_CTRL_PREFIX environment variable" >&2
    exit 3
fi

if [ -z "$CAM_PREFIX" ]; then
    echo "Camera prefix not set. Please use the -c option or set \$CAM_PREFIX environment variable" >&2
    exit 3
fi

cd "$IOC_BOOT_DIR"

EPICS_CA_MAX_ARRAY_BYTES="$EPICS_CA_MAX_ARRAY_BYTES" \
MTR_CTRL_PREFIX="$MTR_CTRL_PREFIX" \
CAM_PREFIX="$CAM_PREFIX" \
P="$P" R="$R" "$IOC_BIN" stScreen.cmd
