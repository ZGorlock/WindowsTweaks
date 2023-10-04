@echo off
setlocal enabledelayedexpansion

set "branch=%~1"
if "!branch!"=="" (
	set branch=master
) else (
	set "branch=!branch: =!"
	set "branch=!branch:origin/=!"
)

git switch --no-guess "!branch!"
git pull
