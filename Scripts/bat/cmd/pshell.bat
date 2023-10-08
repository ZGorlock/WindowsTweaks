@echo off
setlocal enabledelayedexpansion

set "cmd=%~1"
set "cmd=!cmd:\"="!"
set "cmd=!cmd:"=\"!"

PowerShell -NoProfile -ExecutionPolicy Bypass -Command "!cmd!"
