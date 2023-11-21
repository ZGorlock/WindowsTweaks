@echo off
setlocal enabledelayedexpansion

set "file=%~1"

goto :main


:main
	if "!file!"=="" (
		for %%f in (*.mp4) do (call :stripMetadata "%%f")
	) else (
		call :stripMetadata "!file!"
	)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	goto :end


:stripMetadata
	set "fn=%~n1"
	set "fx=%~x1"
	set "fx=!fx:.=!"
	
	set src="!fn!.!fx!"
	set out="!fn!.new.!fx!"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !src! (
		
		echo Stripping: !src!
		echo        to: !out!
		
		set "ffmpeg_cmd=ffmpeg -hide_banner -strict -2 -i !src! -map 0 -c copy -map_metadata -1 -map_chapters -1 -write_xing 0 -id3v2_version 0 -write_id3v2 0 -write_apetag 0 -y !out!"
		
		echo.
		echo !ffmpeg_cmd!
		echo.
		echo --------------------------------------------------
		echo.
		
		!ffmpeg_cmd!
		exit /b 0
		
	) else (
		echo !src! does not exist
	)
	
	exit /b 1


:end
	echo Done
