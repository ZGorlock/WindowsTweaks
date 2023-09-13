@echo off
setlocal

set link=%~1
set target=%~2

if exist "%target%" (
	if exist "%target%\*" (
		call link /J "%link%" "%target%"
	) else (
		echo The specified target is not a directory.
	)
) else (
	echo The specified target does not exist.
)
