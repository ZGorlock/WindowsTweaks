@echo off

set video=a.mp4
set subs=a.srt

set title=b


#set in= -i "%video%" 
set in= -i "%video%" -i "%subs%" 

#set params= -map 0 -c copy 
#set params= -map 0 -c:v copy -c:a copy -c:s mov_text 
set params= -map 0 -map 1 -c:v copy -c:a copy -c:s mov_text 
#set params= -map 0 -map 1 -map -0:a:0 -map -0:s -c:v copy -c:a copy -c:s mov_text 
#set params= -map 0 -map 1 -c:v libx264 -c:a copy -c:s mov_text -b:v 2000k -maxrate 2000k -bufsize 2000k 

set baseParams= -y -hide_banner -map_metadata -1 -map_chapters -1 

set out="%title%.mp4"


@echo on

ffmpeg %in% %baseParams% %params% %out%

ffmpeg -i %out%
pause
