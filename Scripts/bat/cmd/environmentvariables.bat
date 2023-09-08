@echo off
setlocal

set rundll32="C:\Windows\system32\rundll32.exe"

start "" %rundll32% sysdm.cpl,EditEnvironmentVariables
