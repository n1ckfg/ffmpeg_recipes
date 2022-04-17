@echo off

set FILE_LIST=%1
set VIDEO_INPUT_DIR=%~1

set VIDEO_OUTPUT_FILE=output.mp4

set FFMPEG_PATH=C:\Util\ffmpeg\bin\ffmpeg

cd %VIDEO_INPUT_DIR%

%FFMPEG_PATH% -f concat -i %FILE_LIST% -c copy %VIDEO_OUTPUT_FILE%

@pause
