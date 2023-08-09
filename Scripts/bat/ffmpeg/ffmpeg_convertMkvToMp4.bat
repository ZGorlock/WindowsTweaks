@echo off
setlocal enabledelayedexpansion

set file=%~1

if "%file%"=="" (
	for %%f in (*.mkv) do (call :mkvToMp4 "%%f")
) else (
	call :mkvToMp4 "%file%"
)

echo.
echo --------------------------------------------------
echo.

goto :end


:mkvToMp4
	
	set fn=%~n1
	
	set mkv="!fn!.mkv"
	set mp4="!fn!.mp4"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !mkv! (
		
		echo Converting: !mkv!
		echo         to: !mp4!
		
		set ffmpeg_cmd=ffmpeg -hide_banner -i !mkv! -map 0:v:0 -map 0:a:0 -map 0:s:0 -c:v copy -c:a copy -c:s mov_text -y !mp4!
		
		echo.
		echo !ffmpeg_cmd!
		echo.
		echo --------------------------------------------------
		echo.
		
		!ffmpeg_cmd!
		
	) else (
		echo !mkv! does not exist
	)
	
	exit /b 0


:end
	echo Done
	pause
