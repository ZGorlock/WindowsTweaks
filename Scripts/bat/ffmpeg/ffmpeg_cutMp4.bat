@echo off
setlocal enabledelayedexpansion

set file=%~1
set startTime=%~2
set stopTime=%~3

if "%stopTime%"=="" (
	set stopTime=%startTime%
	set startTime=0
)
if "%stopTime%"=="" (
	echo Start and stop time not provided
	goto :end
)

if "%file%"=="" (
	for %%f in (*.mp4) do (call :cutMp4 "%%f" "%startTime%" "%stopTime%")
) else (
	call :cutMp4 "%file%" "%startTime%" "%stopTime%"
)

echo.
echo --------------------------------------------------
echo.

goto :end


:cutMp4
	
	set fn=%~n1
	set start=%~2
	set stop=%~3
	
	set mp4="!fn!.mp4"
	set out="!fn!.new.mp4"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !mp4! (
		
		echo Cutting: !mp4!
		echo    from: !start! - !stop!
		echo      to: !out!
		
		set ffmpeg_cmd=ffmpeg -hide_banner -ss !start! -to !stop! -i !mp4! -map 0 -c copy -y !out!
		
		echo.
		echo !ffmpeg_cmd!
		echo.
		echo --------------------------------------------------
		echo.
		
		!ffmpeg_cmd!
		
	) else (
		echo !mp4! does not exist
	)
	
	exit /b 0


:end
	echo Done
	pause
