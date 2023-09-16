@echo off
setlocal enabledelayedexpansion

set file=%~1

if "%file%"=="" (
	for %%f in (*.mp4) do (call :mp4ToGif "%%f")
) else (
	call :mp4ToGif "%file%"
)

echo.
echo --------------------------------------------------
echo.

goto :end


:mp4ToGif
	
	set fn=%~n1
	
	set mp4="!fn!.mp4"
	set gif="!fn!.gif"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !mp4! (
		
		echo Converting: !mp4!
		echo         to: !gif!
		
		set "frate=fps=20"
REM		set "frate=mpdecimate,setpts=N/FRAME_RATE/TB"
		
REM		set "scale=scale=-1:-1:flags=lanczos"
		set "scale=scale=if(gte(iw\,ih)\,min(1280\,iw)\,-2):if(lt(iw\,ih)\,min(1280\,ih)\,-2):flags=lanczos"
		
		set "split=split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse"
		set filter=!frate!,!scale!,!split!
		
		set ffmpeg_cmd=ffmpeg -hide_banner -i !mp4! -vf "!filter!" -loop 0 -y !gif!
		
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
