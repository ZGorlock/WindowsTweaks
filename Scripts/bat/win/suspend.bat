@echo off
setlocal

set rundll32="C:\Windows\system32\rundll32.exe"

start "" %rundll32% powrprof.dll,SetSuspendState
