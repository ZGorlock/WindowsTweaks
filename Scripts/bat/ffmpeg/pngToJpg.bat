@echo off
setlocal enabledelayedexpansion

set "file=%~1"


:main
	if "!file!"=="" (
		for %%f in (*.png) do (call :pngToJpg "%%f")
	) else (
		call :pngToJpg "!file!"
	)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	goto :end


:pngToJpg
	set "fn=%~n1"
	
	set png="!fn!.png"
	set jpg="!fn!.jpg"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !png! (
		
		echo Converting: !png!
		echo         to: !jpg!
		
		set "ffmpeg_cmd=ffmpeg -hide_banner -i !png! -f image2 -c:v mjpeg -q:v 1 -y !jpg!"
		
		echo.
		echo !ffmpeg_cmd!
		echo.
		echo --------------------------------------------------
		echo.
		
		!ffmpeg_cmd!
		exit /b 0
		
	) else (
		echo !png! does not exist
	)
	
	exit /b 1


:end
	echo Done
