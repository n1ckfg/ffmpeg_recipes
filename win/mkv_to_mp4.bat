@echo off

set VIDEO_INPUT_FILE="%~1"

set VIDEO_OUTPUT_EXTENSION=.mp4
set VIDEO_OUTPUT_FILE=%VIDEO_INPUT_FILE%%VIDEO_OUTPUT_EXTENSION%

set FFMPEG_PATH=C:\Util\ffmpeg\bin\ffmpeg.exe

%FFMPEG_PATH% -i %VIDEO_INPUT_FILE% -c copy -strict -2 -map 0:0 -map 0:1 %VIDEO_OUTPUT_FILE%

@pause
