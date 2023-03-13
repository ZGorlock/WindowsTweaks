@echo off

if not exist "%~1" (type NUL > "%~1")
