@echo off
setlocal enabledelayedexpansion

if '%~3'=='' (
	set flag=/S
	set link=%~1
	set target=%~2
) else (
	set flag=%~1
	set link=%~2
	set target=%~3
)

if '!flag!'=='' (set flag=/S)
if /i '!flag:~-1!'=='S' (set type=S)
if /i '!flag:~-1!'=='D' (set type=S)
if /i '!flag:~-1!'=='H' (set type=H)
if /i '!flag:~-1!'=='J' (set type=H)

if exist "%target%" (
	if /i '!type!'=='S' (
		if exist "%target%\*" (set flag=/D) else (set flag=)
	) else if /i '!type!'=='H' (
		if exist "%target%\*" (set flag=/J) else (set flag=/H)
	)
	
	mklink !flag! "%link%" "%target%"
	
) else (
	echo The specified target does not exist.
)
