@echo off
@setlocal enabledelayedexpansion

set "flags=/b"
set "pattern=*"

:readArgs
	if not "%~1"=="" (
		set "arg=%~1"
		if "!arg:~0,1!"=="/" (
			set "flags=!flags! !arg!"
		) else if not "!arg!"=="" (
			set "pattern=*!arg!*"
		)
		shift && goto readArgs
	)

dir !flags! "!pattern!"
