@echo off
setlocal enabledelayedexpansion

set "file=%~1"


:main
	if "!file!"=="" (
		for %%f in (*.*) do (call :videoInfo "%%f")
	) else (
		call :videoInfo "!file!"
	)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	goto :end


:videoInfo
	set "fn=%~n1"
	set "fx=%~x1"
	set "fx=!fx:.=!"
	
	set source="!fn!.!fx!"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !source! (
		
		echo Source: !source!
		
		set "ffprobe_cmd=ffprobe -hide_banner !source!"
		
		echo.
		
		!ffprobe_cmd!
		exit /b 0
		
	) else (
		echo !source! does not exist
	)
	
	exit /b 1


:end
	echo Done
