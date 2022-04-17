@echo off

set VIDEO_INPUT_FILE="%~1"

set VIDEO_OUTPUT_EXTENSION=.mp4
set VIDEO_OUTPUT_FILE=%VIDEO_INPUT_FILE%%VIDEO_OUTPUT_EXTENSION%

set FFMPEG_PATH=C:\Util\ffmpeg\bin\ffmpeg.exe

%FFMPEG_PATH% -i %VIDEO_INPUT_FILE% -c:v copy -map 0:0 -map 0:1 -c:a:0 aac -ac 2 -af "aresample=matrix_encoding=dplii" %VIDEO_OUTPUT_FILE%

@pause
