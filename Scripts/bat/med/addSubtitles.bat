@echo off
setlocal enabledelayedexpansion

set "file=%~1"

goto :main


:main
	if "!file!"=="" (
		for %%f in (*.mp4) do (call :addSubtitles "%%f")
	) else (
		call :addSubtitles "!file!"
	)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	goto :end


:addSubtitles
	set "fn=%~n1"
	set "fx=%~x1"
	set "fx=!fx:.=!"
	
	set src="!fn!.!fx!"
	set sub="!fn!.srt"
	set out="!fn!.new.!fx!"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !src! (
		if exist !sub! (
			
			echo Subbing: !src!
			echo    with: !sub!
			echo      to: !out!
			
			set "ffmpeg_cmd=ffmpeg -hide_banner -i !src! -i !sub! -map 0 -map 1 -c:v copy -c:a copy -c:s mov_text -y !out!"
			
			echo.
			echo !ffmpeg_cmd!
			echo.
			echo --------------------------------------------------
			echo.
			
			!ffmpeg_cmd!
			exit /b 0
			
		) else (
			echo !sub! does not exist
		)
	) else (
		echo !src! does not exist
	)
	
	exit /b 1


:end
	echo Done
