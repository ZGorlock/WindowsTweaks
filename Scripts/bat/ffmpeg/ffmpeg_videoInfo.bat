@echo off
setlocal enabledelayedexpansion


set file=%~1


if "%file%"=="" (
	for %%f in (*.*) do (call :vInfo "%%f")
) else (
	call :vInfo "%file%"
)

echo.
echo --------------------------------------------------
echo.

goto :end


:vInfo
	
	set f=%~1
	
	echo.
	echo --------------------------------------------------
	echo.
	
	ffprobe -hide_banner "%f%"
	
	exit /b 0


:end
	endlocal
