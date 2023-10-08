@echo off
setlocal enabledelayedexpansion

set "file=%~1"

goto :main


:main
	if "!file!"=="" (
		for %%f in (*.webp) do (call :webpToJpg "%%f")
	) else (
		call :webpToJpg "!file!"
	)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	goto :end


:webpToJpg
	set "fn=%~n1"
	
	set webp="!fn!.webp"
	set  jpg="!fn!.jpg"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !webp! (
		
		echo Converting: !webp!
		echo         to: !jpg!
		
		set "ffmpeg_cmd=ffmpeg -hide_banner -i !webp! -f image2 -c:v mjpeg -q:v 1 -y !jpg!"
		
		echo.
		echo !ffmpeg_cmd!
		echo.
		echo --------------------------------------------------
		echo.
		
		!ffmpeg_cmd!
		exit /b 0
		
	) else (
		echo !webp! does not exist
	)
	
	exit /b 1


:end
	echo Done
