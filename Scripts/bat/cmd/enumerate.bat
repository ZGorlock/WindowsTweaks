@echo off
setlocal enabledelayedexpansion

set "flags="
set "pattern="
set "output=enum.txt"
set "overwrite="

:readArgs
	if not '%1'=='' (
		set "arg=%~1"
		if "!arg:~0,1!"=="/" (
			if /i not "!arg!"=="/y" (
				set "flags=!flags! !arg!"
			) else (
				set "overwrite=!arg!"
			)
		) else if not "!arg!"=="" (
			if "!pattern!"=="" (
				set "pattern=!arg!"
			) else (
				set "output=!arg!"
			)
		)
		shift && goto readArgs
	)

if exist "!output!" (
	if /i not "!overwrite!"=="/y" (
		choice /c yn /n /m "Output file '!output!' already exists. Overwrite? [y/n]"
		if ERRORLEVEL 2 (exit /b 1)
	)
	del "!output!"
)

call touch "!output!"
for /f "tokens=*" %%x in ('locate !flags! "!pattern!"') do (
	if not "%%x"=="!output!" if not "%%x"=="%cd%\!output!" (>> "!output!" echo %%x)
)
