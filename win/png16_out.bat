@echo off

set VIDEO_INPUT_FILE="%~1"

rem https://en.wikibooks.org/wiki/FFMPEG_An_Intermediate_Guide/image_sequence

set VIDEO_INPUT_PATH=%~dp1

cd /D %~dp1
mkdir output16
set IMAGE_OUTPUT_PATH=%~dp1output16\image-%%05d.png

set FFMPEG_PATH=C:\Util\ffmpeg\bin\ffmpeg

rem 16-bit
%FFMPEG_PATH% -y -i %VIDEO_INPUT_FILE% -pix_fmt yuv444p10le %IMAGE_OUTPUT_PATH%

@pause