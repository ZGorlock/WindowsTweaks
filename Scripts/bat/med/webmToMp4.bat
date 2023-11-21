@echo off
setlocal enabledelayedexpansion

set "file=%~1"

goto :main


:main
	if "!file!"=="" (
		for %%f in (*.webm) do (call :webmToMp4 "%%f")
	) else (
		call :webmToMp4 "!file!"
	)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	goto :end


:webmToMp4
	set "fn=%~n1"
	
	set webm="!fn!.webm"
	set  mp4="!fn!.mp4"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !webm! (
		
		echo Converting: !webm!
		echo         to: !mp4!
		
		set "ffmpeg_cmd=ffmpeg -hide_banner -i !webm! -map 0:v:0 -map 0:a:0 -c:v libx264 -c:a copy -y !mp4!"
		
		echo.
		echo !ffmpeg_cmd!
		echo.
		echo --------------------------------------------------
		echo.
		
		!ffmpeg_cmd!
		exit /b 0
		
	) else (
		echo !webm! does not exist
	)
	
	exit /b 1


:end
	echo Done
