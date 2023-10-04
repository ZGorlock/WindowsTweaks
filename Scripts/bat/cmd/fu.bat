@echo off
setlocal enabledelayedexpansion

set "file=%~1"

if "!file!"=="" (
	echo No path was specified.
	
) else if exist "!file!\*" (
	echo The specified path is not a file.
	
) else if exist "!file!" (
	set "size=#"
	for %%x in (!file!) do (set "size=%%~zx")
	echo Size: !size!
	exit /b 0
	
) else (
	echo The specified path does not exist.
)

exit /b 1
