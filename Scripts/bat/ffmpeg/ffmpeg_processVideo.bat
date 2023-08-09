@echo off
setlocal enabledelayedexpansion

set SOURCE=a.mp4
set   SUBS=a.srt

set TARGET=b.mp4

echo.
echo --------------------------------------------------
echo.

if exist "!SOURCE!" (
	
	echo Processing: "!SOURCE!"
	echo         to: "!TARGET!"
	
	if exist "!SUBS!" (
		set in=-i "!SOURCE!" -i "!SUBS!"
		echo      +subs: "!SUBS!"
	) else (
		set in=-i "!SOURCE!"
	)
	
	set out="!TARGET!"
	
	set baseParams=-y -hide_banner -map_metadata -1 -map_chapters -1
	
REM	Copy source streams; Keep encoding
REM	set params=-map 0 -c copy
	
REM	Copy source streams; Keep video and audio encoding; Encode subtitles as mov_text
REM	set params=-map 0 -c:v copy -c:a copy -c:s mov_text
	
REM	Copy source streams; Mux subtitle stream from second file; Keep video and audio encoding; Encode subtitles as mov_text
REM	set params=-map 0 -map 1 -c:v copy -c:a copy -c:s mov_text
	
REM	Copy source video and audio streams only; Mux subtitle stream from second file; Keep video and audio encoding
	set params=-map 0 -map 1 -map -0:s -c:v copy -c:a copy -c:s mov_text
	
REM	Copy source video and audio streams only; Drop first audio stream from source; Mux subtitle stream from second file; Keep video and audio encoding; Encode subtitles as mov_text
REM	set params=-map 0 -map 1 -map -0:a:0 -map -0:s -c:v copy -c:a copy -c:s mov_text
	
REM	Copy source streams; Mux subtitle stream from second file; Keep audio encoding; Re-encode video streams to libx264 with a target video bitrate of 2MB/s; Encode subtitles as mov_text
REM	set params=-map 0 -map 1 -c:v libx264 -c:a copy -c:s mov_text -b:v 2000k -maxrate 2000k -bufsize 2000k
	
	set ffmpeg_cmd=ffmpeg !in! !baseParams! !params! !out!
	
	echo.
	echo !ffmpeg_cmd!
	echo.
	echo --------------------------------------------------
	echo.
	
	!ffmpeg_cmd!
	
) else (
	echo "!SOURCE!" does not exist
)

echo.
echo --------------------------------------------------
echo.

echo Done
pause
