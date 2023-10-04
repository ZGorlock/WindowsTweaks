@echo off
setlocal enabledelayedexpansion

set origin=
for /f "tokens=*" %%x in ('gitConfig "remote.origin.url"') do (set "origin=%%x")

if "!origin!"=="" (
	exit /b 1
) else (
	echo !origin!
)
