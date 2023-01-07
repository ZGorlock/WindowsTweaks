@echo off

setlocal enabledelayedexpansion
for %%f in (*.mp4) do (
	
	set fn=%%~nf
	
	set mp4="!fn!.mp4"
	set gif="!fn!.gif"
	set png="!fn!.png"
	
	echo Converting: !mp4!
	echo         to: !gif!
	
	set filter=fps=25,scale=-1:-1:flags=lanczos
	
	ffmpeg -i !mp4! -vf "!filter!,palettegen" -y !png!
	ffmpeg -i !mp4! -i !png! -lavfi "!filter! [x]; [x][1:v] paletteuse" -y !gif!
	del !png!
	
)
endlocal

echo Done
