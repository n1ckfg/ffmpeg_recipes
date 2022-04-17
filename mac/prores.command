#!/bin/bash

VIDEO_INPUT_FILE="Unity_2016-04-15_16-26-58-34.avi"

# https://transcoding.wordpress.com/2012/01/29/prores-ffmpeg/
# 0 : ProRes422 (Proxy)
# 1 : ProRes422 (LT)
# 2 : ProRes422 (Normal)
# 3 : ProRes422 (HQ)
PROFILE="3"

# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ 
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ 

VIDEO_INPUT_PATH="$DIR/" 

OUTPUT_PATH=$VIDEO_INPUT_PATH
OUTPUT_EXTENSION=".mov"
OUTPUT_FILE=$VIDEO_INPUT_FILE$OUTPUT_EXTENSION

FFMPEG_PATH="ffmpeg"

$FFMPEG_PATH -y -threads 3 -i $VIDEO_INPUT_PATH$VIDEO_INPUT_FILE -vcodec prores -profile:v $PROFILE -acodec pcm_s16le -threads 3 -cpu-used 2 $OUTPUT_PATH$OUTPUT_FILE
