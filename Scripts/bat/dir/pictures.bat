@echo off
setlocal

set loc=%MyPictures%

if '%loc%'=='' (
	explorer shell:pictures
) else (
	explorer %loc%
)
