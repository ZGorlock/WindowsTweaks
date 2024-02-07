@echo off
setlocal enabledelayedexpansion

set "flag=%~1"
if /i '!flag:~1!'=='u' (
	explorer shell:startup
) else (
	explorer "%ProgramData%\Microsoft\Windows\Start Menu\Programs\Startup"
)
