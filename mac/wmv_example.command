#!/bin/bash

INPUT_PATH="/Users/nick/Desktop/"
INPUT_FILE="test.mov"

OUTPUT_PATH="/Users/nick/Desktop/"
OUTPUT_FILE="test.wmv"

SIZE="1920:1080"

VIDEO_BITRATE="10M"
AUDIO_BITRATE="256k"

# ultrafast,superfast, veryfast, faster, fast, medium, slow, slower, veryslow, placebo
ENCODE_SPEED="slow"

FFMPEG_PATH="/usr/local/bin/ffmpeg"

$FFMPEG_PATH -y -threads 3 -i $INPUT_PATH$INPUT_FILE -vf scale=$SIZE,colormatrix=bt709:bt601 -vcodec msmpeg4 -preset:v $ENCODE_SPEED -pix_fmt yuv420p -b:v $VIDEO_BITRATE -acodec wmav2 -strict -2 -b:a $AUDIO_BITRATE -threads 3 -cpu-used 2 $OUTPUT_PATH$OUTPUT_FILE