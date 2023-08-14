@echo off
setlocal

set url="%~1"
set out="%~2"

echo.
echo --------------------------------------------------
echo.

if %url%==""      (goto :end)
if %url%=="start" (goto :listen)

call :download
goto :end


:download
	set video=false
	if not '%url%'=='%url:/video=%'      (set video=true)
	if not '%url%'=='%url:/view_video=%' (set video=true)
	if not '%url%'=='%url:/watch=%'      (set video=true)
	if not '%url%'=='%url:/playlist=%'   (set video=true)
	if not '%url%'=='%url:/episode=%'    (set video=true)
	
	if not exist %out% (mkdir %out%)
	cd /D %out%
	
	if "%video%"=="true" (
		echo Using yt-dlp...
		yt-dlp -f mp4 -S res:720 %url%
	) else (
		echo Using gallery-dl...
		gallery-dl --verbose --dest %out% %url%
	)
	
	exit /b 0


:listen
	set url=""
	set /p url=: 
	set url="%url:"=%"
	
	if %url%=="" (goto :end)
	
	call :download
	
	echo.
	echo --------------------------------------------------
	echo.
	
	goto :listen


:end
	echo.
	echo --------------------------------------------------
	echo.
