@echo off
setlocal

set link=%~1
set target=%~2

if exist "%target%" (
	if exist "%target%\*" (
		echo The specified target is not a file.
	) else (
		call link /H "%link%" "%target%"
	)
) else (
	echo The specified target does not exist.
)
