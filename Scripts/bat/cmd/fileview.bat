@echo off
setlocal

set rundll32="C:\Windows\system32\rundll32.exe"

start "" %rundll32% shell32.dll,Options_RunDLL 7
