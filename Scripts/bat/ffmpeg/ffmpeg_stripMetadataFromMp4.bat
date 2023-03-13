@echo off
setlocal enabledelayedexpansion


set file=%~1


if "%file%"=="" (
	for %%f in (*.mp4) do (call :stripMetadataFromMp4 "%%f")
) else (
	call :stripMetadataFromMp4 "%file%"
)

echo.
echo --------------------------------------------------
echo.

goto :end


:stripMetadataFromMp4
	
	set fn=%~n1
	
	set mp4="!fn!.mp4"
	set out="!fn!.new.mp4"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !mp4! (
		
		echo Stripping: !mp4!
		echo        to: !out!
		
		set ffmpeg_cmd=ffmpeg -hide_banner -i !mp4! -map_metadata -1 -map_chapters -1 -map 0 -c copy -y !out!
		
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
	endlocal
	pause
