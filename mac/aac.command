#!/bin/bash

VIDEO_INPUT_PATH="/Users/nick/Desktop/"
VIDEO_INPUT_FILE="test_%05d.tif"
INPUT_FPS="30"

AUDIO_INPUT_PATH="/Users/nick/Desktop/"
AUDIO_INPUT_FILE="test.wav"

OUTPUT_PATH="/Users/nick/Desktop/"
OUTPUT_FILE="test.mp4"
OUTPUT_FPS="30"

START_NUMBER="00000"
SIZE="1920:1080"

# 15/20/2, 10/15/2, 8/10/2
# https://trac.ffmpeg.org/wiki/Encode/H.264
# https://support.octoshape.com/entries/25126002-Encoding-best-practices-using-ffmpeg
VIDEO_BITRATE="10M"
VIDEO_BITRATE_MAX="12M"
VIDEO_BITRATE_MIN="2M"
VIDEO_BUFFER="20M"
AUDIO_BITRATE="256k"

# ultrafast,superfast, veryfast, faster, fast, medium, slow, slower, veryslow, placebo
ENCODE_SPEED="slow"
PROFILE="main"
LEVEL="5.1"

FFMPEG_PATH="/usr/local/bin/ffmpeg"

# AUDIO
# $FFMPEG_PATH -y -threads 3 -r $INPUT_FPS -f image2 -start_number $START_NUMBER -i $VIDEO_INPUT_PATH$VIDEO_INPUT_FILE -i $AUDIO_INPUT_PATH$AUDIO_INPUT_FILE -vf scale=$SIZE -vcodec libx264 -preset:v $ENCODE_SPEED -pix_fmt yuv420p -b:v $VIDEO_BITRATE -maxrate $VIDEO_BITRATE_MAX -minrate $VIDEO_BITRATE_MIN -bufsize $VIDEO_BUFFER -profile:v $PROFILE -level $LEVEL -acodec aac -strict -2 -b:a $AUDIO_BITRATE -threads 3 -cpu-used 2 -r $OUTPUT_FPS $OUTPUT_PATH$OUTPUT_FILE

# NO AUDIO
$FFMPEG_PATH -y -threads 3 -r $INPUT_FPS -f image2 -start_number $START_NUMBER -i $VIDEO_INPUT_PATH$VIDEO_INPUT_FILE -vf colormatrix=bt601:bt709 -vf scale=$SIZE -vcodec libx264 -preset:v $ENCODE_SPEED -pix_fmt yuv420p -b:v $VIDEO_BITRATE -maxrate $VIDEO_BITRATE_MAX -minrate $VIDEO_BITRATE_MIN -bufsize $VIDEO_BUFFER -profile:v $PROFILE -level $LEVEL -threads 3 -cpu-used 2 -r $OUTPUT_FPS $OUTPUT_PATH$OUTPUT_FILE

# -vf scale=$SIZE 