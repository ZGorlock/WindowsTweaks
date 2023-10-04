@echo off
setlocal enabledelayedexpansion

set "file=%~1"


:main
	if "!file!"=="" (
		for %%f in (*.jpg) do (call :jpgToPng "%%f")
	) else (
		call :jpgToPng "!file!"
	)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	goto :end


:jpgToPng
	set "fn=%~n1"
	
	set jpg="!fn!.jpg"
	set png="!fn!.png"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !jpg! (
		
		echo Converting: !jpg!
		echo         to: !png!
		
		set "ffmpeg_cmd=ffmpeg -hide_banner -i !jpg! -f image2 -c:v png -q:v 1 -y !png!"
		
		echo.
		echo !ffmpeg_cmd!
		echo.
		echo --------------------------------------------------
		echo.
		
		!ffmpeg_cmd!
		exit /b 0
		
	) else (
		echo !jpg! does not exist
	)
	
	exit /b 1


:end
	echo Done
