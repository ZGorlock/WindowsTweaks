@echo off
setlocal

set action=%1

set ip=%PhoneIP%

if "%action%"==""           (set script=scrcpy_start)
if "%action%"=="start"      (set script=scrcpy_start)
if "%action%"=="connect"    (set script=scrcpy_start)
if "%action%"=="usb"        (set script=scrcpy_usb)
if "%action%"=="ip"         (set script=scrcpy_web %ip%)
if "%action%"=="tcpip"      (set script=scrcpy_web %ip%)
if "%action%"=="init"       (set script=scrcpy_web %ip%)
if "%action%"=="clear"      (set script=scrcpy_clear)
if "%action%"=="drop"       (set script=scrcpy_clear)
if "%action%"=="disconnect" (set script=scrcpy_clear)

set args=
set args=%args% --turn-screen-off
set args=%args% --stay-awake
::set args=%args% --otg --hid-keyboard --hid-mouse
::set args=%args% --verbosity verbose

call %script% %args%
