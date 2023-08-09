@echo off

if "%~1"=="" (
	exit /b 0
	
) else if exist "%~1" (
	if exist "%~1\*" (
		echo The specified path is not a file.
	) else (
		echo Size: %~z1
	)
	
) else (
	echo The specified path does not exist.
)
