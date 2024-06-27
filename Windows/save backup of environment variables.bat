@echo off
setlocal

set "backupDir=%UserProfile%\Desktop\EnvVarsBackup"
if not exist "%backupDir%" (mkdir "%backupDir%")

set "reg_SystemEnv=HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Environment"
set   "reg_UserEnv=HKCU\Environment"

set "key_SystemEnv=%reg_SystemEnv:\=_%"
set   "key_UserEnv=%reg_UserEnv:\=_%"

set "key_SystemEnv=%key_SystemEnv: =%"
set   "key_UserEnv=%key_UserEnv: =%"

reg export "%reg_SystemEnv%" "%backupDir%\%key_SystemEnv%.reg" /y
reg export "%reg_UserEnv%"   "%backupDir%\%key_UserEnv%.reg"   /y

reg query  "%reg_SystemEnv%" /s >"%backupDir%\EnvVars_System.txt"
reg query  "%reg_UserEnv%"   /s >"%backupDir%\EnvVars_User.txt"


:: https://stackoverflow.com/questions/573817/where-are-environment-variables-stored-in-the-windows-registry
