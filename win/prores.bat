@echo off

set VIDEO_INPUT_FILE="%~1"

rem https://transcoding.wordpress.com/2012/01/29/prores-ffmpeg/
rem 0 : ProRes422 (Proxy)
rem 1 : ProRes422 (LT)
rem 2 : ProRes422 (Normal)
rem 3 : ProRes422 (HQ)
set PROFILE=2

set VIDEO_INPUT_PATH=%~dp1

set VIDEO_OUTPUT_EXTENSION=_prores.mov
set VIDEO_OUTPUT_FILE=%VIDEO_INPUT_FILE%%VIDEO_OUTPUT_EXTENSION%

set FFMPEG_PATH=C:\Util\ffmpeg\bin\ffmpeg

%FFMPEG_PATH% -y -threads 3 -i %VIDEO_INPUT_FILE% -vcodec prores -profile:v %PROFILE% -acodec pcm_s16le -threads 3 -cpu-used 2 %VIDEO_OUTPUT_FILE%

@pause