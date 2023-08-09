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
	set png="!fn!.png"
	set gif="!fn!.gif"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !mp4! (
		
		echo Converting: !mp4!
		echo         to: !gif!
		
		set filter=fps=25,scale=-1:-1:flags=lanczos
		
		set ffmpeg_cmd_1=ffmpeg -hide_banner -i !mp4! -vf "!filter!,palettegen" -y !png!
		
		set ffmpeg_cmd_2=ffmpeg -hide_banner -i !mp4! -i !png! -lavfi "!filter! [x]; [x][1:v] paletteuse" -y !gif!
		
		echo.
		echo !ffmpeg_cmd_1!
		echo.
		echo !ffmpeg_cmd_2!
		echo.
		echo --------------------------------------------------
		echo.
		
		!ffmpeg_cmd_1!
		
		!ffmpeg_cmd_2!
		
		del !png!
		
	) else (
		echo !mp4! does not exist
	)
	
	exit /b 0


:end
	echo Done
	pause
