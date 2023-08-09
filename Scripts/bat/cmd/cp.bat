@echo off
setlocal

set flags=/I /K /-Y /C /B
if exist "%~1\*" (set flags=/E %flags%)

xcopy "%~1" "%~2" %flags%
