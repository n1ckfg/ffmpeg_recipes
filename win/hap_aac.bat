@echo off

set VIDEO_INPUT_FILE="%~1"

rem https://gist.github.com/dlublin/e4585b872dd136ae88b2aa51a6a89aac
rem -format hap_alpha
rem -format hap_q
set PROFILE=
set CHUNKS=2
set AUDIO_BITRATE=320k

set VIDEO_INPUT_PATH=%~dp1

set VIDEO_OUTPUT_EXTENSION=_hap.mov
set VIDEO_OUTPUT_FILE=%VIDEO_INPUT_FILE%%VIDEO_OUTPUT_EXTENSION%

set FFMPEG_PATH=C:\Util\ffmpeg\bin\ffmpeg

%FFMPEG_PATH% -y -threads 3 -i %VIDEO_INPUT_FILE% -c:v hap %PROFILE% -chunks %CHUNKS% -acodec aac -strict -2 -b:a %AUDIO_BITRATE% -threads 3 -cpu-used 2 %VIDEO_OUTPUT_FILE%

@pause