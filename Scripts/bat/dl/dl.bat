@echo off

if not "%~1"=="~" (
	setlocal enabledelayedexpansion
	call "%~nx0" "~" %*
	goto :end
)
shift /1

goto :init


:init
	if "%~1"=="~" (exit /b 1)
	
	set "input=%~1"
	
	set "out=%~2"
	if '!out!'=='' (set "out=%DLOutput%")
	if '!out!'=='' (set "out=%Downloads%\.dl")
	if '!out!'=='' (set "out=%UserProfile%\Downloads\.dl")
	
	set "galleryDl=gallery-dl"
	set "youtubeDl=yt-dlp"
::	set "youtubeDl=youtube-dl"
	set "githubDl=gitSave"
	set "defaultDl=wget"
	
	set "directYtDl=false"
	set "autoDlExe=false"
	set "updateExe=false"
	set "forceUpdate=false"
	
	set "exec="
	set "args="
	
	set "condaEnv=dl"
	set "env="
	
	set "run=false"
	set "log=true"
	set "url="
	
	call :logSeparator
	title %~n0
	
	goto :main


:main
	call :command
	call :process
	
	goto :input


:input
	if /i not '!run!'=='true' (exit /b 0)
	
	call :logSeparator
	title %~n0
	
	set /p  "input=: " ^
	 || set "input="
	
	if not '!input!'=='' (set "input=!input: =!")
	if not '!input!'=='' (title %~n0 - !input!)
	
	goto :main


:command
	if '!input!'=='~' (exit /b 1)
	
	if /i '!log!'=='true' (
		>> "%~dp0dl.log" echo:!input!
	)
	
	if /i '!input!'=='start'    (call :startThread)
	if /i '!input!'=='run'      (call :startThread)
	if /i '!input!'=='server'   (call :startThread)
	if /i '!input!'=='listen'   (call :startThread)
	if /i '!input!'=='loop'     (call :startThread)
	
	if /i '!input!'=='stop'     (call :stopThread)
	if /i '!input!'=='exit'     (call :stopThread)
	if /i '!input!'=='end'      (call :stopThread)
	if /i '!input!'=='quit'     (call :stopThread)
	if /i '!input!'=='break'    (call :stopThread)
	if /i '!input!'=='x'        (call :stopThread)
	if /i '!input!'==''         (call :stopThread)
	
	if /i '!input!'=='open'     (call :openOutput)
	if /i '!input!'=='browse'   (call :openOutput)
	if /i '!input!'=='explore'  (call :openOutput)
	if /i '!input!'=='explorer' (call :openOutput)
	if /i '!input!'=='pop'      (call :openOutput)
	if /i '!input!'=='dir'      (call :openOutput)
	
	if /i '!input!'=='cls'      (call :clearConsole)
	if /i '!input!'=='clear'    (call :clearConsole)
	if /i '!input!'=='refresh'  (call :clearConsole)
	if /i '!input!'=='reset'    (call :clearConsole)
	
	if '!input!'=='!input://=!' (set "input=")
	
	exit /b 0


:startThread
	if /i '!run!'=='true' (exit /b 1)
	
	echo Listening...
	set "run=true"
	
	exit /b 0


:stopThread
	if /i not '!run!'=='true' (exit /b 1)
	
	echo Done
	set "run=false"
	
	exit /b 0


:openOutput
	if '!out!'=='' (exit /b 1)
	call :initOutput
	
	if not exist "!out!" (exit /b 1)
	echo !out!
	
	explorer "!out!"
	
	exit /b 0


:clearConsole
	cls
	title %~n0
	
	exit /b 0


:process
	if '!input!'=='' (exit /b 0)
	call :initProcessor
	
	if '!input!'=='!input://=!' (exit /b 1)
	set "url=!input!"
	set "input="
	
	call :download
	
	set "url="
	
	exit /b 0


:download
	if '!url!'=='' (exit /b 1)
	call :initDownloader
	
	if '!exec!'==''            (exit /b 1)
	if '!exec!'=='!galleryDl!' (call :galleryDl)
	if '!exec!'=='!youtubeDl!' (call :youtubeDl)
	if '!exec!'=='!githubDl!'  (call :githubDl)
	if '!exec!'=='!defaultDl!' (call :defaultDl)
	
	if not '!args!'=='' (set "args=!args:~1!")
	if     '!args!'=='' (exit /b 1)
	
	title %~n0 [!exec!] - !url!
	echo !exec! !args!
	
	!exec! !args!
	
	set "exec="
	set "args="
	
	exit /b 0


:galleryDl
	if not '!exec!'=='!galleryDl!' (exit /b 1)
	if not '!args!'==''            (exit /b 1)
	if      '!url!'==''            (exit /b 1)
	if      '!out!'==''            (exit /b 1)
	
	set "args="
	set "args=!args! --verbose"
::	set "args=!args! --filter "date ^<^= datetime(2016, 9, 25)""
::	set "args=!args! --no-download"
	set "args=!args! --dest "!out!""
	set "args=!args! "!url!""
	
	exit /b 0


:youtubeDl
	if not '!exec!'=='!youtubeDl!' (exit /b 1)
	if not '!args!'==''            (exit /b 1)
	if      '!url!'==''            (exit /b 1)
	if      '!out!'==''            (exit /b 1)
	
	set "args="
	set "args=!args! --verbose"
::	set "args=!args! --quiet"
::	set "args=!args! --retries 100"
::	set "args=!args! --limit-rate 1000K"
	set "args=!args! --format bestvideo[height<=?720]+bestaudio/best"
	set "args=!args! --merge-output-format mp4"
	set "args=!args! --output "!out!\%%(title)s.%%(ext)s""
	set "args=!args! "!url!""
	
	exit /b 0


:githubDl
	if not '!exec!'=='!githubDl!' (exit /b 1)
	if not '!args!'==''           (exit /b 1)
	if      '!url!'==''           (exit /b 1)
	if      '!out!'==''           (exit /b 1)
	
	set "args="
	set "args=!args! "!url!""
	set "args=!args! "!out!""
	
	exit /b 0


:defaultDl
	if not '!exec!'=='!defaultDl!' (exit /b 1)
	if not '!args!'==''            (exit /b 1)
	if      '!url!'==''            (exit /b 1)
	if      '!out!'==''            (exit /b 1)
	
	set "args="
	set "args=!args! --verbose"
::	set "args=!args! --debug"
::	set "args=!args! --quiet"
	set "args=!args! --no-hsts"
	set "args=!args! --https-only"
	set "args=!args! --server-response"
	set "args=!args! --force-directories"
	set "args=!args! -P "!out!""
	set "args=!args! "!url!""
	
	exit /b 0


:initDownloader
	set "exec="
	set "args="
	
	if not '!defaultDl!'=='' (
		if /i "!url:~-4,1!"=="."                   (set "exec=!defaultDl!")
		if /i "!url:~-3,1!"=="."                   (set "exec=!defaultDl!")
		if /i "!url:~-2,1!"=="."                   (set "exec=!defaultDl!")
		if '!exec!'=='' (
			if /i not '!url!'=='!url:.html=!'      (set "exec=!defaultDl!")
			if /i not '!url!'=='!url:.php?=!'      (set "exec=!defaultDl!")
		)
	)
	
	if not '!githubDl!'=='' (
		if /i "!url:~-4!"==".git"                  (set "exec=!githubDl!")
		if '!exec!'=='' (
			if /i not '!url!'=='!url:github.com=!' (set "exec=!githubDl!")
		)
	)
	
	if not '!youtubeDl!'=='' (
		if '!exec!'=='' (
			if /i not '!url!'=='!url:youtube.com=!' (set "exec=!youtubeDl!")
			if /i not '!url!'=='!url:youtu.be=!'    (set "exec=!youtubeDl!")
		)
	)
	
	if not '!galleryDl!'=='' (
		if '!exec!'==''                             (set "exec=!galleryDl!")
	)
	
	if '!exec!'=='' (
		echo Downloader not available for: !url!
		exit /b 1
	)
	echo Using !exec!...
	
	exit /b 0


:initProcessor
	call :initOutput
	call :initExe
	
	call :setupEnv
	
	exit /b 0


:initOutput
	if '!out!'=='' (exit /b 1)
	
	if not exist "!out!" (mkdir "!out!")
	if not exist "!out!" (
		echo Output directory does not exist: !out!
		exit /b 1
	)
	
	cd /d "!out!"
	
	exit /b 0


:initExe
	if not '!exec!'=='' (exit /b 1)
	
	if not '!defaultDl!'=='' (
		call :loadExe "!defaultDl!"
		set "defaultDl=!exec!"
		set "exec="
	)
	
	if not '!galleryDl!'=='' (
		if '!galleryDl!'=='gallery-dl' (
			call :loadExe "gallery-dl" "https://github.com/mikf/gallery-dl/releases/latest/download/gallery-dl.exe"
		) else (
			call :loadExe "!galleryDl!"
		)
		set "galleryDl=!exec!"
		set "exec="
	)
	
	if not '!youtubeDl!'=='' (
		if '!youtubeDl!'=='yt-dlp' (
			call :loadExe "yt-dlp" "https://github.com/yt-dlp/yt-dlp/releases/latest/download/yt-dlp.exe"
		) else if '!youtubeDl!'=='youtube-dl' (
			call :loadExe "youtube-dl" "https://github.com/ytdl-org/youtube-dl/releases/latest/download/youtube-dl.exe"
		) else (
			call :loadExe "!youtubeDl!"
		)
		set "youtubeDl=!exec!"
		set "exec="
	)
	if /i not '!directYtDl!'=='true' (
		set "youtubeDl="
	)
	
	exit /b 0


:loadExe
	set "exec="
	
	if "%~1"=="" (exit /b 1)
	if exist "%~dp0%~1.exe" (
		set "exec=%~1"
	)
	
	if /i '!updateExe!'=='true' (
		if exist "%~dp0%~1.exe" (
			set "exec=%~1"
			if /i '!forceUpdate!'=='true' (
				!exec! --update
				if not '!env!'=='' (
					py -3 -m pip install --upgrade !exec![eager]
				)
			)
			
		) else (
			if /i '!autoDlExe!'=='true' (
				if not '!defaultDl!'=='' (
					if not "%~2"=="" (
						!defaultDl! -q -P "%~dp0." "%~2"
					)
				)
				if not '!env!'=='' (
					py -3 -m pip install --upgrade !exec![eager]
				)
			)
		)
	)
	
	for /f "tokens=*" %%f in ('where "%~1" 2^>nul') do (
		set "exec=%%~nf"
		exit /b 0
	)
	
	exit /b 1


:setupEnv
	if not '!env!'==''      (exit /b 1)
	if     '!condaEnv!'=='' (exit /b 1)
	
	set "env=!condaEnv!"
	call conda activate "!env!"
	
	exit /b 0


:shutdownEnv
	if    '!env!'==''     (exit /b 1)
	if /i '!run!'=='true' (exit /b 1)
	
	set "env="
	call conda deactivate
	
	exit /b 0


:logSeparator
	echo.
	echo --------------------------------------------------
	echo.
	
	exit /b 0


:end
	call :stopThread
	call :shutdownEnv
	
	call :logSeparator
	for %%f in (%comspec%) do (title %%~nf)
	
	endlocal
::	pause
	
	exit /b
