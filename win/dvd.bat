@echo off

set VIDEO_INPUT_DIR="%~1"
set FILE_LIST=%VIDEO_INPUT_DIR%.txt

set VIDEO_BITRATE=4M
set VIDEO_BITRATE_MAX=6M
set VIDEO_BITRATE_MIN=2M
set AUDIO_BITRATE=320k

set ENCODE_SPEED=slow
set PROFILE=main
set LEVEL=4.1

set VIDEO_OUTPUT_EXTENSION=.mp4
set VIDEO_OUTPUT_FILE=%VIDEO_INPUT_DIR%%VIDEO_OUTPUT_EXTENSION%

set FFMPEG_PATH=C:\Util\ffmpeg\bin\ffmpeg

cd %VIDEO_INPUT_DIR%

rem https://trac.ffmpeg.org/wiki/Concatenate
(for %%i in (*.vob) do @echo file '%%i') > %FILE_LIST%

%FFMPEG_PATH% -f concat -i %FILE_LIST% -vcodec libx264 -preset:v %ENCODE_SPEED% -b:v %VIDEO_BITRATE% -maxrate %VIDEO_BITRATE_MAX% -minrate %VIDEO_BITRATE_MIN% -profile:v %PROFILE% -level %LEVEL% -acodec aac -strict -2 -b:a %AUDIO_BITRATE% %VIDEO_OUTPUT_FILE%

@pause
