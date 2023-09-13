@echo off
setlocal

set link=%~1
set target=%~2

if exist "%target%" (
	if exist "%target%\*" (
		call link /D "%link%" "%target%"
	) else (
		call link /S "%link%" "%target%"
	)
) else (
	echo The specified target does not exist.
)
