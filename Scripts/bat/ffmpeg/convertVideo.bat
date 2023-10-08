@echo off
setlocal enabledelayedexpansion

set "iFormat=%~1"
if not "!iFormat!"=="!iFormat:.=!" (
	set iFile=!iFormat!
	set iFormat=!iFormat:~-3!
)
if "!iFormat!"=="" (
	echo No input format specified.
	exit /b 1
)

set "oFormat=%~2"
if not "!oFormat!"=="!oFormat:.=!" (
	set oFile=!oFormat!
	set oFormat=!oFormat:~-3!
)

set "args=%~3"
if "!args!"=="" (
	set "args=-map 0 -c copy"
)

goto :main


:main
	if "!iFile!"=="" (
		for %%f in (*.!iFormat!) do (call :convertVideo "%%f")
	) else (
		call :convertVideo "!iFile!"
	)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	goto :end


:convertVideo
	set "fn=%~n1"
	set "fx=%~x1"
	set "fx=!fx:.=!"
	
	if "!iFile!"=="" (
		if "!iFormat!"=="" (
			set source="!fn!.!fx!"
		) else if "!iFormat!"=="*" (
			set source="!fn!.!fx!"
		) else (
			set source="!fn!.!iFormat!"
		)
	) else (
		set source="!iFile!"
	)
	
	if "!oFile!"=="" (
		if "!oFormat!"=="" (
			set target="!fn!.new.!fx!"
		) else if "!oFormat!"=="*" (
			set target="!fn!.new.!fx!"
		) else if "!oFormat!"=="!fx!" (
			set target="!fn!.new.!oFormat!"
		) else (
			set target="!fn!.!oFormat!"
		)
	) else (
		set target="!oFile!"
	)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !source! (
		
		echo Converting: !source!
		echo         to: !target!
		
		set "ffmpeg_cmd=ffmpeg -hide_banner -i !source! !args! -y !target!"
		
		echo.
		echo !ffmpeg_cmd!
		echo.
		echo --------------------------------------------------
		echo.
		
		!ffmpeg_cmd!
		exit /b 0
		
	) else (
		echo !source! does not exist
	)
	
	exit /b 1


:end
	echo Done
