@echo off
setlocal

echo --------------------
echo --------------------
echo TP-Link Toggle
echo --------------------
echo --------------------

set url=https://use1-wap.tplinkcloud.com

set toggle=%~1

set deviceId=%~2

set username=%~3
if '%username%'=='' (set username=%TPLinkUser%)

set password=%~4
if '%password%'=='' (set password=%TPLinkPass%)

set uuid=%~5
if '%uuid%'=='' (set uuid=%TPLinkUUID%)

echo url          = %url%
echo toggle       = %toggle%
echo deviceId     = %deviceId%
echo username     = %username%
echo password     = %password%
echo uuid         = %uuid%

if "%toggle%"=="off" (set state=0) else (set state=1)

echo --------------------
for /f "tokens=1 delims=~" %%a in ('curl -X POST -H "Content-Type: application/json" -d "{ \"method\" : \"login\", \"params\" : { \"appType\" : \"Kasa_Android\", \"cloudPassword\" : \"%password%\", \"cloudUserName\" : \"%username%\", \"terminalUUID\" : \"%uuid%\" } }" %url%') do (set token_curl=%%a)
echo %token_curl%
echo --------------------

set "token_curl=%token_curl:{=%"
set "token_curl=%token_curl:}=%"
set "token_curl=%token_curl:"result":=%"
set "token_curl=%token_curl:"=%"
set "token_curl=%token_curl::==%"
set "%token_curl:,=" & set "%"

echo accountId    = %accountId%
echo nickname     = %nickname%
echo email        = %email%
echo token        = %token%

:: echo --------------------
:: for /f "tokens=1 delims=" %%a in ('curl -X POST -H "Content-Type: application/json" -d "{ \"method\" : \"getDeviceList\" }" "%url%?token=%token%"') do (set deviceId_curl=%%a)
:: echo %deviceId_curl%
:: echo --------------------

echo deviceId     = %deviceId%

echo --------------------
for /f "tokens=1 delims=~" %%a in ('curl -X POST -H "Content-Type: application/json" -d "{ \"method\" : \"passthrough\", \"params\" : { \"deviceId\" : \"%deviceId%\", \"requestData\" : \"{ \\\"system\\\" : { \\\"set_relay_state\\\" : { \\\"state\\\" : %state% } } }\" } }" "%url%?token=%token%"') do (set passthrough_curl=%%a)
echo %passthrough_curl%
echo --------------------

echo Done
