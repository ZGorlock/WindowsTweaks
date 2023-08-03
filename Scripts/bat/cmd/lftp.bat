@echo off
setlocal


set server=%~1

set dest=%~2
if '%dest%'=='' (set dest=./.mirror)

FOR /F "tokens=1,2* delims=:/" %%G IN ("%server%") DO (
	set "protocol=%%G"
	set "host=%%H"
	set "resource=%%I"
)


mkdir "%dest%"

C:\cygwin64\bin\lftp -e "mirror -c --parallel=20 --verbose /%resource% %dest%;quit;" %protocol%://%host%


endlocal
