@echo off
setlocal enabledelayedexpansion

set "file=%~1"
if "!file:~0,1!"=="/" (
	set "flag=!file:~1!"
	set "file=%~2"
)

set type=x
if /i '!flag:~-1!'=='C' (set type=c)
if /i '!flag:~-1!'=='M' (set type=w)
if /i '!flag:~-1!'=='W' (set type=w)
if /i '!flag:~-1!'=='A' (set type=a)
if /i '!flag:~-1!'=='R' (set type=a)

if "!file!"=="" (
	echo No path was specified.
	
) else if exist "!file!" (
	if /i '!type!'=='x' (
		for %%f in ("%~1") do (echo %%~tf)
	) else (
		set "fdate="
		for /f "skip=5 tokens=1,2,3 delims= " %%a in ('dir /a /t:!type! "!file!"') do (
			if "!fdate!"=="" (set "fdate=%%~a %%~b %%~c")
		)
		echo !fdate!
	)
	exit /b 0
	
) else (
	echo The specified path does not exist.
)

exit /b 1
