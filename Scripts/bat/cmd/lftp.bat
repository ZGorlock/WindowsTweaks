@echo off
setlocal

set lftp="C:\cygwin64\bin\lftp"

set server=%~1
for /f "tokens=1,2* delims=:/" %%g in ("%server%") do (
	set "protocol=%%g"
	set "host=%%h"
	set "resource=%%i"
)

set dest=%~2
if '%dest%'=='' (set dest=./.mirror)

mkdir "%dest%"

%lftp% -e "mirror -c --parallel=20 --verbose /%resource% %dest%;quit;" %protocol%://%host%
