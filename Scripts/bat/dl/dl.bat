@echo off
setlocal enabledelayedexpansion

set url=%~1

set out=%~2
if '!out!'=='' (set "out=%DLOutput%")
if '!out!'=='' (set "out=%Downloads%\.dl")
if '!out!'=='' (set "out=%UserProfile%\Downloads\.dl")

set env=dl

echo.
echo --------------------------------------------------
echo.

if '!url!'==''       (goto :end)
if '!url!'=='start'  (goto :listen)
if '!url!'=='server' (goto :listen)
if '!url!'=='listen' (goto :listen)
if '!url!'=='pop'    (goto :open)
if '!url!'=='open'   (goto :open)

call :download
goto :end


:download
	set video=false
	if not '!url!'=='!url:/video=!'      (set video=true)
	if not '!url!'=='!url:/view_video=!' (set video=true)
	if not '!url!'=='!url:/watch=!'      (set video=true)
	if not '!url!'=='!url:/playlist=!'   (set video=true)
	if not '!url!'=='!url:/episode=!'    (set video=true)
	
	if not exist "!out!" (mkdir "!out!")
	cd /D "!out!"
	
	if not '%env%'=='' (call conda activate %env%)
	
	if '%video%'=='true' (
		echo Using yt-dlp...
		yt-dlp -f mp4 -S res:720 -o "!out!\%%(title)s.%%(ext)s" "!url!"
	) else (
		echo Using gallery-dl...
		gallery-dl --verbose --dest "!out!" "!url!"
	)
	
	if not '%env%'=='' (call conda deactivate)
	
	exit /b 0


:listen
	set url=
	set /p url=: 
	
	if '!url!'=='' (goto :end)
	
	call :download
	
	echo.
	echo --------------------------------------------------
	echo.
	
	goto :listen


:open
	if not exist "!out!" (mkdir "!out!")
	
	explorer "!out!"
	
	goto :end


:end
	echo.
	echo --------------------------------------------------
	echo.
