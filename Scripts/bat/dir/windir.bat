@echo off
setlocal

set loc=%WinDir%

if '%loc%'=='' (
	systemroot
) else (
	explorer %loc%
)
