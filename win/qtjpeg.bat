@echo off

set VIDEO_INPUT_FILE="%~1"

rem https://stackoverflow.com/questions/32147805/ffmpeg-generate-higher-quality-images-for-mjpeg-encoding
rem quality scale is 2-31, lower is better
set PROFILE=3

set VIDEO_INPUT_PATH=%~dp1

set VIDEO_OUTPUT_EXTENSION=_qtjpeg.mov
set VIDEO_OUTPUT_FILE=%VIDEO_INPUT_FILE%%VIDEO_OUTPUT_EXTENSION%

set FFMPEG_PATH=C:\Util\ffmpeg\bin\ffmpeg

%FFMPEG_PATH% -y -threads 3 -i %VIDEO_INPUT_FILE% -c:v mjpeg -q:v %PROFILE% -acodec pcm_s16le -threads 3 -cpu-used 2 %VIDEO_OUTPUT_FILE%

@pause