@echo off
setlocal

set cmd="C:\Windows\System32\cmd.exe"

powershell Start-Process %cmd% '/k cd /d %cd%' -Verb RunAs
