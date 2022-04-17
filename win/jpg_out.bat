@echo off

set VIDEO_INPUT_FILE="%~1"

rem https://en.wikibooks.org/wiki/FFMPEG_An_Intermediate_Guide/image_sequence

set VIDEO_INPUT_PATH=%~dp1

cd /D %~dp1
mkdir output
set IMAGE_OUTPUT_PATH=%~dp1output\image-%%05d.jpg

set FFMPEG_PATH=C:\Util\ffmpeg\bin\ffmpeg

rem 8-bit
%FFMPEG_PATH% -y -i %VIDEO_INPUT_FILE% %IMAGE_OUTPUT_PATH%

@pause