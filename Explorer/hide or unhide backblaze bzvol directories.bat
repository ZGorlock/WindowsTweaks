@echo off
setlocal enabledelayedexpansion

for /f "tokens=2*delims==" %%i in ('wmic logicaldisk get caption /value') do (
	for /f "delims=" %%d in ("%%i") do (
		set "bzvol=%%d\.bzvol"
		
		if exist "!bzvol!" (
			echo "!bzvol!"
			
			REM [Hide]
			REM attrib +s +h "!bzvol!"
			
			REM [Unhide]
			REM attrib -s +h "!bzvol!"
		)
	)
)
