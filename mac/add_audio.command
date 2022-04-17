#!/bin/bash

VIDEO_FILE="input.mp4"

AUDIO_FILE="input_audio.aac"

OUTPUT_FILE="test.mp4"

SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"

cd $DIR

ffmpeg -i $VIDEO_FILE -i $AUDIO_FILE -map 0 -map 1 -c copy $OUTPUT_FILE	
