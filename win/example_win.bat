@echo off

set VIDEO_INPUT_PATH=C:\Users\Username\Desktop\
set VIDEO_INPUT_FILE=Comp1.mp4

set VIDEO_BITRATE=40M
set VIDEO_BITRATE_MAX=45M
set VIDEO_BITRATE_MIN=5M
set AUDIO_BITRATE=320k

set ENCODE_SPEED=slow
set PROFILE=high
set LEVEL=5.2

set OUTPUT_PATH=%VIDEO_INPUT_PATH%
set OUTPUT_EXTENSION=.mp4
set OUTPUT_FILE=%VIDEO_INPUT_FILE%%OUTPUT_EXTENSION%

set FFMPEG_PATH=C:\Util\ffmpeg\bin\ffmpeg

%FFMPEG_PATH% -i %VIDEO_INPUT_PATH%%VIDEO_INPUT_FILE% -vcodec libx264 -preset:v %ENCODE_SPEED% -b:v %VIDEO_BITRATE% -maxrate %VIDEO_BITRATE_MAX% -minrate %VIDEO_BITRATE_MIN% -profile:v %PROFILE% -level %LEVEL% -acodec aac -strict -2 -b:a %AUDIO_BITRATE% %OUTPUT_PATH%%OUTPUT_FILE%

@pause
