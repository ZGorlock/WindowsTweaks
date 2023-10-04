@echo off

if /i "%~1"=="all" (
	git pull --all
) else (
	git pull %*
)
