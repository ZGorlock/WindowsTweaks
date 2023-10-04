@echo off
setlocal enabledelayedexpansion

set "branch=%~1"
if "!branch!"=="" (
	echo No branch was specified.
	exit /b 1
) else (
	set "branch=!branch: =!"
	set "branch=!branch:origin/=!"
)

git fetch origin
git switch -c "!branch!" --track "origin/!branch!"
git switch "!branch!"
git pull
