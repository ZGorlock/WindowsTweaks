@echo off
setlocal enabledelayedexpansion

set "file=%~1"
set "startTime=%~2"
set "stopTime=%~3"

if "!stopTime!"=="" (
	set "stopTime=!startTime!"
	set "startTime=0"
)
if "!stopTime!"=="" (
	echo Start and stop time not provided
	exit /b 1
)

goto :main


:main
	if "!file!"=="" (
		for %%f in (*.mp4) do (call :cutVideo "%%f" "!startTime!" "!stopTime!")
	) else (
		call :cutVideo "!file!" "!startTime!" "!stopTime!"
	)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	goto :end


:cutVideo
	set "fn=%~n1"
	set "fx=%~x1"
	set "fx=!fx:.=!"
	
	set "start=%~2"
	set "stop=%~3"
	
	set src="!fn!.!fx!"
	set out="!fn!.new.!fx!"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !src! (
		
		echo Cutting: !src!
		echo    from: !start! - !stop!
		echo      to: !out!
		
		call :getVideoCodec !src!
		
		set "ffmpeg_cmd=ffmpeg -hide_banner -ss !start! -to !stop! -i !src! -map 0 -c:v !vcodec! -c:a copy -c:s copy -y !out!"
		
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


:getVideoCodec
	set vcodec=copy
	
	for /f "delims=" %%i in ('ffprobe -hide_banner -v quiet -i "%~1" -print_format "compact=p=0:nk=1" -select_streams v:0 -show_entries "stream=codec_name"') do (set vcodec=%%i)
	if '!vcodec!'=='hevc' (set vcodec=libx265) else (set vcodec=libx264)
	
	exit /b 0


:end
	echo Done
