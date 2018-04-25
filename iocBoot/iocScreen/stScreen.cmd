#!../../bin/linux-x86_64/screen

< envPaths

epicsEnvSet("TOP", "../..")

< screen.config

cd "${TOP}"

## Register all support components
dbLoadDatabase "dbd/screen.dbd"
screen_registerRecordDeviceDriver pdbbase

cd "${TOP}/iocBoot/${IOC}"

## Load records

dbLoadRecords("$(TOP)/db/screen.db", "MTR_CTRL_PREFIX=$(MTR_CTRL_PREFIX), CAM_PREFIX=$(CAM_PREFIX), P=$(P), R=$(R)")

< save_restore.cmd

iocInit

# save things every 5 seconds
create_monitor_set("auto_settings_screen.req", 5,"P=$(P), R=$(R)")
# The following line is necessary because of the save file name used in save_restore.cmd
set_savefile_name("auto_settings_screen.req", "auto_settings_$(P)$(R).sav")
