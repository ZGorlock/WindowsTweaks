@echo off

if /i "%~1"=="all" (
	git fetch --all
) else (
	git fetch %*
)
