@echo off
setlocal

set rsync="C:\cygwin64\bin\rsync"

%rsync% %*
