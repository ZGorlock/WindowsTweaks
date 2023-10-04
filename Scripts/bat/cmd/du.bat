@echo off
setlocal enabledelayedexpansion

set du64="C:\Program Files\SysInternals\du64.exe"

set "file=%~1"
if "!file!"=="" (set "file=.")

if exist "!file!\*" (
	%du64% -nobanner -q "!file!"
	exit /b 0
	
) else if exist "!file!" (
	echo The specified path is not a directory.
	
) else (
	echo The specified path does not exist.
)

exit /b 1
