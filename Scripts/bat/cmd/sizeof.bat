@echo off
setlocal enabledelayedexpansion

set "file=%~1"
if "!file!"=="" (set "file=.")

if exist "!file!\*" (
	set "size=#"
	set "temp=#"
	for /f "tokens=3" %%x in ('dir /a:-d /s /w /-c "!file!"') do (
		set "size=!temp!"
		set "temp=%%x"
	)
    echo !size!
	exit /b 0
	
) else if exist "!file!" (
	set "size=#"
	for %%x in (!file!) do (set "size=%%~zx")
	echo !size!
	exit /b 0
	
) else (
	echo The specified path does not exist.
)

exit /b 1
