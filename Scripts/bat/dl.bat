@echo off
setlocal

set url="%~1"
set out=E:/Downloads/dl

set video=false
if not '%url%'=='%url:/video=%'      (set video=true)
if not '%url%'=='%url:/view_video=%' (set video=true)
if not '%url%'=='%url:/watch=%'      (set video=true)
if not '%url%'=='%url:/playlist=%'   (set video=true)
if not '%url%'=='%url:/episode=%'    (set video=true)

if not exist "%out%" (mkdir "%out%")
cd /D "%out%"

if "%video%"=="true" (
	echo Using yt-dlp...
	yt-dlp -f "(mp4)[height<=720]" %url%
) else (
	echo Using gallery-dl...
	gallery-dl --verbose --dest "%out%" %url%
)

endlocal
