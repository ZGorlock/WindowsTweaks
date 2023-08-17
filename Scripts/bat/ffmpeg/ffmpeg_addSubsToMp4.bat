@echo off
setlocal enabledelayedexpansion

set file=%~1

if "%file%"=="" (
	for %%f in (*.mp4) do (call :addSubsToMp4 "%%f")
) else (
	call :addSubsToMp4 "%file%"
)

echo.
echo --------------------------------------------------
echo.

goto :end


:addSubsToMp4
	
	set fn=%~n1
	
	set mp4="!fn!.mp4"
	set srt="!fn!.srt"
	set out="!fn!.new.mp4"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !mp4! (
		if exist !srt! (
			
			echo Subbing: !mp4!
			echo    with: !srt!
			echo      to: !out!
			
			set ffmpeg_cmd=ffmpeg -hide_banner -i !mp4! -i !srt! -map 0 -map 1 -c:v copy -c:a copy -c:s mov_text -y !out!
			
			echo.
			echo !ffmpeg_cmd!
			echo.
			echo --------------------------------------------------
			echo.
			
			!ffmpeg_cmd!
		
		) else (
			echo !srt! does not exist
		)
	) else (
		echo !mp4! does not exist
	)
	
	exit /b 0


:end
	echo Done
