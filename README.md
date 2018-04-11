# screen-epics-ioc

### Overall

Repository containing the EPICS IOC for the Fluorescent Screen application.
This is a Soft IOC for managing the screen from a high-level standpoint.
It requires a [motion controller IOC](https://github.com/lnls-dig/galil-dmc30017-epics-ioc),
responsible for moving the screen and controlling the LEDs, and a
[camera IOC](https://github.com/lnls-dig/basler-acA1300-75gm-epics-ioc),
responsible for beam transverse profile imaging, already running.

### Building

In order to build the IOC, from the top level directory, run:

```sh
$ make clean uninstall install
```
### Running

In order to run the IOC, from the top level directory, run:

```sh
$ cd iocBoot/iocScreen &&
$ ./runScreen.sh -m "MTR_CTRL_PREFIX" -c "CAM_PREFIX"
```

where `MTR_CTRL_PREFIX` is the prefix used for the motion controller
IOC, and `CAM_PREFIX` is the prefix used for the camera IOC.
The options that you can specify (after `./runScreen.sh`) are:

- `-m MTR_CTRL_PREFIX`: the prefix used for the motion controller IOC (required)
- `-c CAM_PREFIX`: the prefix used for the camera IOC (required)
- `-P PREFIX1`: the value of the EPICS `$(P)` macro used to prefix the PV names
- `-R PREFIX2`: the value of the EPICS `$(R)` macro used to prefix the PV names

In some situations it is desired to run the process using procServ,
which enables the IOC to be controlled by the system. In order to
run the IOC with procServ, instead of the previous command, run:

```sh
$ procServ -n "SCREEN" -f -i ^C^D 20000 ./runScreen.sh -m "Test:Controller:" -c "Test:Camera:" -P "Test:" -R "Screen:"
```

where the options are as previously described.
