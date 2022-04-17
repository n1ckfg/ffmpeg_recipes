#!/bin/bash

AUDIO_INPUT_FILE="test.mp3"
FREQUENCY="44100"
BITRATE="256k"

# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ 
SOURCE="${BASH_SOURCE[0]}"
while [ -h "$SOURCE" ]; do # resolve $SOURCE until the file is no longer a symlink
  DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
  SOURCE="$(readlink "$SOURCE")"
  [[ $SOURCE != /* ]] && SOURCE="$DIR/$SOURCE" # if $SOURCE was a relative symlink, we need to resolve it relative to the path where the symlink file was located
done
DIR="$( cd -P "$( dirname "$SOURCE" )" && pwd )"
# ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ 

AUDIO_INPUT_PATH="$DIR/" 

OUTPUT_PATH=$AUDIO_INPUT_PATH
OUTPUT_EXTENSION=".mp3"
OUTPUT_FILE=$AUDIO_INPUT_FILE$OUTPUT_EXTENSION

FFMPEG_PATH="ffmpeg"

$FFMPEG_PATH -y -threads 3 -i $AUDIO_INPUT_PATH$AUDIO_INPUT_FILE  -vn -ar $FREQUENCY -ac 2 -b:a $BITRATE  -threads 3 -cpu-used 2 $OUTPUT_PATH$OUTPUT_FILE
