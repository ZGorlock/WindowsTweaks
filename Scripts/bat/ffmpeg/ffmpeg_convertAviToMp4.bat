@echo off
setlocal enabledelayedexpansion

set file=%~1

if "%file%"=="" (
	for %%f in (*.avi) do (call :aviToMp4 "%%f")
) else (
	call :aviToMp4 "%file%"
)

echo.
echo --------------------------------------------------
echo.

goto :end


:aviToMp4
	
	set fn=%~n1
	
	set avi="!fn!.avi"
	set mp4="!fn!.mp4"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !avi! (
		
		echo Converting: !avi!
		echo         to: !mp4!
		
		set ffmpeg_cmd=ffmpeg -hide_banner -i !avi! -map 0 -c:v copy -c:a copy -c:s mov_text -y !mp4!
		
		echo.
		echo !ffmpeg_cmd!
		echo.
		echo --------------------------------------------------
		echo.
		
		!ffmpeg_cmd!
		
	) else (
		echo !avi! does not exist
	)
	
	exit /b 0


:end
	echo Done
	pause
