@echo off
setlocal

set "backupDir=%UserProfile%\Desktop\FolderViewsBackup"
if not exist "%backupDir%" (mkdir "%backupDir%")

set reg_SoftwareShell=HKCU\Software\Microsoft\Windows\Shell
set   reg_NoRoamShell=HKCU\Software\Microsoft\Windows\ShellNoRoam
set  reg_ClassesShell=HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell
set  reg_WowNodeShell=HKCU\Software\Classes\Wow6432Node\Local Settings\Software\Microsoft\Windows\Shell

set key_SoftwareShell=%reg_SoftwareShell:\=_%
set   key_NoRoamShell=%reg_NoRoamShell:\=_%
set  key_ClassesShell=%reg_ClassesShell:\=_%
set  key_WowNodeShell=%reg_WowNodeShell:\=_%

set key_SoftwareShell=%key_SoftwareShell: =%
set   key_NoRoamShell=%key_NoRoamShell: =%
set  key_ClassesShell=%key_ClassesShell: =%
set  key_WowNodeShell=%key_WowNodeShell: =%

REG EXPORT "%reg_SoftwareShell%\BagMRU" "%backupDir%\%key_SoftwareShell%_BagMRU.reg" /y
REG EXPORT "%reg_SoftwareShell%\Bags"   "%backupDir%\%key_SoftwareShell%_Bags.reg"   /y
REG EXPORT "%reg_NoRoamShell%\Bags"     "%backupDir%\%key_NoRoamShell%_Bags.reg"     /y
REG EXPORT "%reg_NoRoamShell%\BagMRU"   "%backupDir%\%key_NoRoamShell%_BagMRU.reg"   /y
REG EXPORT "%reg_ClassesShell%\BagMRU"  "%backupDir%\%key_ClassesShell%_BagMRU.reg"  /y
REG EXPORT "%reg_ClassesShell%\Bags"    "%backupDir%\%key_ClassesShell%_Bags.reg"    /y
REG EXPORT "%reg_WowNodeShell%\BagMRU"  "%backupDir%\%key_WowNodeShell%_BagMRU.reg"  /y
REG EXPORT "%reg_WowNodeShell%\Bags"    "%backupDir%\%key_WowNodeShell%_Bags.reg"    /y


:: https://www.eightforums.com/threads/folder-view-settings-back-up-and-restore-in-windows.32105/
