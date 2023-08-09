@echo off
setlocal enabledelayedexpansion

set file=%~1

if "%file%"=="" (
	for %%f in (*.sup) do (call :supToSrt "%%f")
) else (
	call :supToSrt "%file%"
)

echo.
echo --------------------------------------------------
echo.

goto :end


:supToSrt
	
	set fn=%~n1
	
	set sup="!fn!.sup"
	set srt="!fn!.srt"
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !sup! (
		
		echo Converting: !sup!
		echo         to: !srt!
		
		set subedit_cmd=subedit /convert !sup! subrip /fps:25
		
		echo.
		echo !subedit_cmd!
		echo.
		echo --------------------------------------------------
		echo.
		
		!subedit_cmd!
		
	) else (
		echo !sup! does not exist
	)
	
	exit /b 0


:end
	echo Done
	pause
