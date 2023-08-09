@echo off
setlocal

set lftp="C:\cygwin64\bin\lftp"

set server=%~1
FOR /F "tokens=1,2* delims=:/" %%G IN ("%server%") DO (
	set "protocol=%%G"
	set "host=%%H"
	set "resource=%%I"
)

set dest=%~2
if '%dest%'=='' (set dest=./.mirror)

mkdir "%dest%"

%lftp% -e "mirror -c --parallel=20 --verbose /%resource% %dest%;quit;" %protocol%://%host%
