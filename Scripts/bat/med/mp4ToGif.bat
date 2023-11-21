@echo off
setlocal enabledelayedexpansion

set "file=%~1"
if "!file:~0,1!"=="-" (
	set "mode=!file:~1!"
	set "file=%~2"
)

if "!mode!"=="min" (set mode=1)
if "!mode!"=="mid" (set mode=3)
if "!mode!"=="max" (set mode=5)

set fps=15
if "!mode!"=="1" (set fps=10)
if "!mode!"=="2" (set fps=10)
if "!mode!"=="3" (set fps=15)
if "!mode!"=="4" (set fps=20)
if "!mode!"=="5" (set fps=20)

set dim=720
if "!mode!"=="1" (set dim=360)
if "!mode!"=="2" (set dim=480)
if "!mode!"=="3" (set dim=720)
if "!mode!"=="4" (set dim=1080)
if "!mode!"=="5" (set dim=9999)

goto :main


:main
	if "!file!"=="" (
		for %%f in (*.mp4) do (call :mp4ToGif "%%f")
	) else (
		call :mp4ToGif "!file!"
	)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	goto :end


:mp4ToGif
	set "fn=%~n1"
	
	set mp4="!fn!.mp4"
	set gif="!fn!.gif"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !mp4! (
		
		echo Converting: !mp4!
		echo         to: !gif!
		
		set "frate=fps=!fps!"
REM		set "frate=mpdecimate,setpts=N/FRAME_RATE/TB"
		
REM		set "scale=scale=-1:-1:flags=lanczos"
		set "scale=scale=if(gte(iw\,ih)\,min(!dim!\,iw)\,-2):if(lt(iw\,ih)\,min(!dim!\,ih)\,-2):flags=lanczos"
		
		set "split=split[s0][s1];[s0]palettegen[p];[s1][p]paletteuse"
		
		set "filter=!frate!,!scale!,!split!"
		
		set "ffmpeg_cmd=ffmpeg -hide_banner -i !mp4! -vf "!filter!" -loop 0 -y !gif!"
		
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
