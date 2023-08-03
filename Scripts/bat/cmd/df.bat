@echo off

wmic logicaldisk get DeviceID,FreeSpace,Size,VolumeName
