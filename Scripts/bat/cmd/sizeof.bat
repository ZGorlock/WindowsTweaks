@echo off
setlocal enabledelayedexpansion

if "%~1"=="" (
	exit /b 0
	
) else if exist "%~1\*" (
	set "size=#"
	set "temp=#"
	for /f "tokens=3" %%x in ('dir /a:-d /s /w /-c "%~1"') do (
		set "size=!temp!"
		set "temp=%%x"
	)
    echo !size!
	
) else if exist "%~1" (
	echo %~z1
	
) else (
	exit /b 0
)
