@echo off
setlocal

set toggle=%1

set deviceId=%TPLinkDevice%

call tplink_toggle "%toggle%" "%deviceId%"
