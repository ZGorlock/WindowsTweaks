@echo off
setlocal

set loc=%Downloads%

if '%loc%'=='' (
	explorer shell:downloads
) else (
	explorer %loc%
)
