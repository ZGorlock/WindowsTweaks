@echo off
setlocal

set url=%~1

set out=%~2
if '%out%'=='' (set "out=%GitsaveDir%")
if '%out%'=='' (set "out=%Downloads%")
if '%out%'=='' (set "out=%UserProfile%\Downloads")

set repo=%url:https://github.com/=%
set repo=%repo:.git=%
set repo=%repo:/= ]] %
set repo=%out%\%repo%
set repo=%repo:\\=\%

git clone "%url%" "%repo%"
