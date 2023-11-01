@echo off
setlocal

set loc=%MyVideos%

if '%loc%'=='' (
	explorer shell:videos
) else (
	explorer %loc%
)
