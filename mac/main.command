#!/bin/bash

INPUT_PATH="/Users/nick/Desktop/"
INPUT_FILE="test_%05d.tif"
INPUT_FPS="30"

OUTPUT_PATH="/Users/nick/Desktop/"
OUTPUT_FILE="test.mp4"
OUTPUT_FPS="30"

START_NUMBER="00000"
SIZE="4096x1536"
BITRATE="40M"

FFMPEG_PATH="/usr/local/bin/ffmpeg"

$FFMPEG_PATH -y -r $INPUT_FPS -f image2 -start_number $START_NUMBER -i $INPUT_PATH$INPUT_FILE -codec:v libx264 -profile:v high -cpu-used 0 -r $OUTPUT_FPS -pix_fmt yuv420p -s $SIZE -b:v $BITRATE $OUTPUT_PATH$OUTPUT_FILE
