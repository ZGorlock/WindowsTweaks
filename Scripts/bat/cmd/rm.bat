@echo off

if exist "%~1\*" (
	powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteDirectory('%~1','OnlyErrorDialogs','SendToRecycleBin')}"
) else (
	powershell -Command "& {Add-Type -AssemblyName Microsoft.VisualBasic; [Microsoft.VisualBasic.FileIO.FileSystem]::DeleteFile('%~1','OnlyErrorDialogs','SendToRecycleBin')}"
)
