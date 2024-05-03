@echo off
setlocal enabledelayedexpansion

set "cmd=C:\Windows\System32\cmd.exe"
set "arg=/c"
set "dir=%cd%"

set "run=%~1"
if '!run!'=='' (
	set "run=echo:admin:"
	set "arg=/k"
)

powershell Start-Process "!cmd!" '!arg! cd /d "!dir!" "&" !run!' -Verb RunAs
