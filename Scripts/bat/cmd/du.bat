@echo off
setlocal

set du64="C:\Program Files\SysInternals\du64.exe"

if "%~1"=="" (
	%du64% -nobanner -q .
	
) else if exist "%~1" (
	if exist "%~1\*" (
		%du64% -nobanner -q "%~1"
	) else (
		echo The specified path is not a directory.
	)
	
) else (
	echo The specified path does not exist.
)
