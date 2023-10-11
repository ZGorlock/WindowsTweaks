@echo off
setlocal enabledelayedexpansion

set "file=%~1"

goto :main


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
	
	set src="!fn!.!fx!"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !src! (
		
		echo Source: !src!
		
		set "ffprobe_cmd=ffprobe -hide_banner !src!"
		
		echo.
		
		!ffprobe_cmd!
		exit /b 0
		
	) else (
		echo !src! does not exist
	)
	
	exit /b 1


:end
	echo Done
