TOP=../..

include $(TOP)/configure/CONFIG
#----------------------------------------
#  ADD MACRO DEFINITIONS BELOW HERE

#=============================
# Build the IOC application
PROD_IOC = screen

# screen.dbd will be created and installed
DBD += screen.dbd

# screen.dbd will include these files:
screen_DBD += base.dbd

# screen_registerRecordDeviceDriver.cpp derives from screen.dbd
screen_SRCS += screen_registerRecordDeviceDriver.cpp

# Build the main IOC entry point where needed
screen_SRCS_DEFAULT += screenMain.cpp
screen_SRCS_vxWorks += -nil-

# Finally link IOC to the EPICS Base libraries
screen_LIBS += $(EPICS_BASE_IOC_LIBS)

include $(TOP)/configure/RULES
#----------------------------------------
#  ADD EXTRA GNUMAKE RULES BELOW HERE

screen_DBD += calcSupport.dbd
screen_DBD += asSupport.dbd

screen_LIBS += calc
screen_LIBS += autosave
