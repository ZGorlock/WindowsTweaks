@echo off
setlocal enabledelayedexpansion

set "url=%~1"

set "out=%~2"
if '!out!'=='' (set "out=%GitsaveDir%")
if '!out!'=='' (set "out=%Downloads%")
if '!out!'=='' (set "out=%UserProfile%\Downloads")

set listen=false

echo.
echo --------------------------------------------------
echo.

goto :main


:main
	call :command
	call :process
	
	goto :input


:input
	if not '!listen!'=='true' (goto :end)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	set url=
	set /p url=: 
	
	goto :main


:command
	if '!url!'=='start'   (call :start)
	if '!url!'=='server'  (call :start)
	if '!url!'=='listen'  (call :start)
	if '!url!'=='loop'    (call :start)
	
	if '!url!'=='stop'    (call :stop)
	if '!url!'=='quit'    (call :stop)
	if '!url!'=='exit'    (call :stop)
	if '!url!'=='end'     (call :stop)
	if '!url!'=='break'   (call :stop)
	if '!url!'==''        (call :stop)
	
	if '!url!'=='open'    (call :open)
	if '!url!'=='explore' (call :open)
	if '!url!'=='pop'     (call :open)
	if '!url!'=='dir'     (call :open)
	
	exit /b 0


:start
	if '!listen!'=='true' (exit /b 1)
	
	echo Listening...
	set listen=true
	
	exit /b 0


:stop
	if '!listen!'=='false' (exit /b 1)
	
	echo Done
	set listen=false
	
	exit /b 0


:open
	if not exist "!out!" (mkdir "!out!")
	
	echo !out!
	explorer "!out!"
	
	exit /b 0


:process
	if '!url!'==''          (exit /b 1)
	if '!url!'=='!url://=!' (exit /b 1)
	
	if not exist "!out!" (mkdir "!out!")
	cd /D "!out!"
	
	call :download
	
	exit /b 0


:download
	set "repo=!url:https://github.com/=!"
	set "repo=!repo:.git=!"
	set "repo=!repo:/= ]] !"
	set "repo=!out!\!repo!"
	set "repo=!repo:\\=\!"
	
	git clone "!url!" "!repo!"
	
	exit /b 0


:end
	echo.
	echo --------------------------------------------------
	echo.
