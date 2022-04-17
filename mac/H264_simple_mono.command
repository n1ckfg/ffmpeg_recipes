#!/bin/bash

#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

INPUT_FILE_L="/Users/nick/Desktop/testL_%05d.tif"
#INPUT_FILE_R="/Users/nick/Desktop/testR_%05d.tif"
INPUT_FPS="24"

#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

OUTPUT_FILE_L="/Users/nick/Desktop/testL.mp4"
#OUTPUT_FILE_R="/Users/nick/Desktop/testR.mp4"
OUTPUT_FPS="24"

#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

START_NUMBER="00000"
GAMMA="1.0"
SIZE="2048x2048"
BITRATE="40M"

#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

FFMPEG_PATH="/usr/local/bin/ffmpeg"

#This converts gamma into the values ffmpeg expects
GAMMA=$(echo "1/$GAMMA" | bc -l)

CMD_1="$FFMPEG_PATH -y -r $INPUT_FPS -f image2 -start_number $START_NUMBER -i "
CMD_2=" -codec:v libx264 -profile:v high -cpu-used 0 -r $OUTPUT_FPS -pix_fmt yuv420p -vf lutrgb='y=gammaval($GAMMA):u=gammaval($GAMMA):v=gammaval($GAMMA)' -s $SIZE -b:v $BITRATE "
#CMD_2=" -codec:v libx264 -profile:v high -preset slow -threads 0 -r $OUTPUT_FPS -pix_fmt yuv420p -s $SIZE -b:v $BITRATE "

CMD_L="$CMD_1$INPUT_FILE_L$CMD_2$OUTPUT_FILE_L"
#CMD_R="$CMD_1$INPUT_FILE_R$CMD_2$OUTPUT_FILE_R"

echo "."
echo ". ."
echo ". . . You can safely close this window . . ."
echo ". ."
echo "."

# Run two simultaneous ffmpeg processes for left and right movies.
# This is AppleScript--it only works on OS X.
osascript<<EOF
tell application "System Events"
tell process "Terminal" to keystroke "n" using command down
end

tell application "Terminal"
activate
do script with command "$CMD_L" in window 1
end tell

tell application "System Events"
tell process "Terminal" to keystroke "n" using command down
end

tell application "Terminal"
activate
do script with command "$CMD_R" in window 1
end tell
EOF