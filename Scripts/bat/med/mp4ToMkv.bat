@echo off
setlocal enabledelayedexpansion

set "file=%~1"

goto :main


:main
	if "!file!"=="" (
		for %%f in (*.mp4) do (call :mp4ToMkv "%%f")
	) else (
		call :mp4ToMkv "!file!"
	)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	goto :end


:mp4ToMkv
	set "fn=%~n1"
	
	set mp4="!fn!.mp4"
	set mkv="!fn!.mkv"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !mp4! (
		
		echo Converting: !mp4!
		echo         to: !mkv!
		
		set "ffmpeg_cmd=ffmpeg -hide_banner -i !mp4! -map 0 -c:v copy -c:a copy -c:s subrip -y !mkv!"
		
		echo.
		echo !ffmpeg_cmd!
		echo.
		echo --------------------------------------------------
		echo.
		
		!ffmpeg_cmd!
		exit /b 0
		
	) else (
		echo !mp4! does not exist
	)
	
	exit /b 1


:end
	echo Done
