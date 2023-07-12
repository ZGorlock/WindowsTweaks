@echo off
setlocal


set url=%~1
set out=%~2


set repo=%url:https://github.com/=%
set repo=%repo:/= ]] %
set repo=%out%\%repo%
set repo=%repo:\\=\%

git clone "%url%" "%repo%"


endlocal
