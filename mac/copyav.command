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

#FFMPEG_PATH="/usr/local/bin/ffmpeg"

# two video+audio files, trim to length of shortest input
#ffmpeg -i $DIR/$VIDEO_FILE -i $DIR/$AUDIO_FILE -c copy -map 0:0 -map 1:1 -shortest $DIR/$OUTPUT_FILE

# just copy one audio file to one video file (no audio) of the same length
#ffmpeg -i $DIR/$VIDEO_FILE -i $DIR/$AUDIO_FILE -c copy $DIR/$OUTPUT_FILE

# replace existing audio in a video and trim to shortest
ffmpeg -y -i $DIR/$VIDEO_FILE -i $DIR/$AUDIO_FILE -c copy -map 0:0 -map 1:0 -shortest -bsf:a aac_adtstoasc $DIR/$OUTPUT_FILE