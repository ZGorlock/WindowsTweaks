@echo off
setlocal enabledelayedexpansion

set "url=%~1"

if not "!url:~0,8!"=="https://" (
	echo URL is not HTTPS: !url!
	set "url=https://"
)

start /ABOVENORMAL "" "!url!"
