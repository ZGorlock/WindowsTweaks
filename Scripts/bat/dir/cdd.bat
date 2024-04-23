@echo off

if not '%~1'=='' (
	if not exist "%~1" (mkdir "%~1")
	cd /d "%~1"
)
