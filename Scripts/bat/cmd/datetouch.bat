@echo off

if exist "%~1" (
	copy /b "%~1" +,, "%~1" 1>nul
)
