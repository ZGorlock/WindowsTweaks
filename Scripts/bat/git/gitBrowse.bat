@echo off
setlocal enabledelayedexpansion

set origin=
for /f "tokens=*" %%x in ('gitOrigin') do (set "origin=%%x")

if "!origin!"=="!origin://=!" (
	exit /b 1
) else (
	echo !origin!
	web "!origin!"
)
