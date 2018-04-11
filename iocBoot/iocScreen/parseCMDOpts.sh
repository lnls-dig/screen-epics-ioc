#!/bin/sh

while [ "$#" -gt 0 ]; do
    case "$1" in
        "-P") P="$2" ;;
        "-R") R="$2" ;;
        "-m"|"--mtr-ctrl-prefix") MTR_CTRL_PREFIX="$2" ;;
        "-c"|"--camera-prefix") CAM_PREFIX="$2" ;;
        *) echo "Usage:" >&2
            echo "  $0 -c CTRL [-P P_VAL] [-R R_VAL]" >&2
            echo >&2
            echo " Options:" >&2
            echo "  -m or --mtr-ctrl-prefix        Configure the motion controller prefix (required)" >&2
            echo "  -c or --camera-prefix          Configure the camera prefix (required)" >&2
            echo "  -P                             Configure value of \$(P) macro" >&2
            echo "  -R                             Configure value of \$(R) macro" >&2
            exit 2
    esac

    shift 2
done

