#!/bin/bash

LIST_PATH="/Users/nick/Desktop/"
LIST_FILE="ffmpeg_concat.txt"

OUTPUT_PATH="/Users/nick/Desktop/"
OUTPUT_FILE="output.mp4"

# FFMPEG_PATH="/usr/local/bin/ffmpeg"

# just copy
ffmpeg -f concat -i $LIST_PATH$LIST_FILE -c copy $OUTPUT_PATH$OUTPUT_FILE