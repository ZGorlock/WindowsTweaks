@echo off
setlocal enabledelayedexpansion

if '%~1'=='' (set "pattern=*") else (set "pattern=%~1")
if '%~2'=='' (set "output=enum.txt") else (set "output=%~2")

if exist "!output!" (
	if /i not '%~4'=='/y' (
		choice /c yn /n /m "Output file '!output!' already exists. Overwrite? [y/n]"
		if ERRORLEVEL 2 (exit /b 1)
	)
	del "!output!"
)

call touch "!output!"
for /f "tokens=*" %%x in ('locate %~3 "!pattern!"') do (
	if not "%%x"=="!output!" (echo %%x >> "!output!")
)
