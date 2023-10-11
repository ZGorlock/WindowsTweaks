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
			set src="!fn!.!fx!"
		) else if "!iFormat!"=="*" (
			set src="!fn!.!fx!"
		) else (
			set src="!fn!.!iFormat!"
		)
	) else (
		set src="!iFile!"
	)
	
	if "!oFile!"=="" (
		if "!oFormat!"=="" (
			set out="!fn!.new.!fx!"
		) else if "!oFormat!"=="*" (
			set out="!fn!.new.!fx!"
		) else if "!oFormat!"=="!fx!" (
			set out="!fn!.new.!oFormat!"
		) else (
			set out="!fn!.!oFormat!"
		)
	) else (
		set out="!oFile!"
	)
	
	echo.
	echo --------------------------------------------------
	echo.
	
	if exist !src! (
		
		echo Converting: !src!
		echo         to: !out!
		
		set "ffmpeg_cmd=ffmpeg -hide_banner -i !src! !args! -y !out!"
		
		echo.
		echo !ffmpeg_cmd!
		echo.
		echo --------------------------------------------------
		echo.
		
		!ffmpeg_cmd!
		exit /b 0
		
	) else (
		echo !src! does not exist
	)
	
	exit /b 1


:end
	echo Done
