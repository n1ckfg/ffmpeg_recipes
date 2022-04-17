#!/bin/bash

VIDEO_INPUT_FILE="Comp1.mov"
INPUT_FPS="30"

SIZE="640:480"

VIDEO_BITRATE="1M"
VIDEO_BITRATE_MAX="1M"
VIDEO_BITRATE_MIN="1M"
VIDEO_BUFFER="2M"
AUDIO_BITRATE="128k"

ENCODE_SPEED="slow"
PROFILE="main"
LEVEL="3.1"

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
OUTPUT_EXTENSION=".mp4"
OUTPUT_FILE=$VIDEO_INPUT_FILE$OUTPUT_EXTENSION
OUTPUT_FPS=$INPUT_FPS

FFMPEG_PATH="/usr/local/bin/ffmpeg"

$FFMPEG_PATH -y -threads 3 -r $INPUT_FPS -i $VIDEO_INPUT_PATH$VIDEO_INPUT_FILE -vf scale=$SIZE -vcodec libx264 -preset:v $ENCODE_SPEED -pix_fmt yuv420p -b:v $VIDEO_BITRATE -maxrate $VIDEO_BITRATE_MAX -minrate $VIDEO_BITRATE_MIN -bufsize $VIDEO_BUFFER -profile:v $PROFILE -level $LEVEL -acodec aac -strict -2 -b:a $AUDIO_BITRATE -threads 3 -cpu-used 2 -r $OUTPUT_FPS $OUTPUT_PATH$OUTPUT_FILE
