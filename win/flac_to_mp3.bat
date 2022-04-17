@echo off

set INPUT_DIR="%~1"

set FFMPEG_PATH=C:\Util\ffmpeg\bin\ffmpeg

cd %INPUT_DIR%
for %%A in (*.flac) do %FFMPEG_PATH% -i "%%~nA.flac" -c:v copy -b:a 320k "%%~nA.mp3"

@pause