#!/bin/bash

#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

INPUT_PATH_L="/Users/nick/Desktop/testL/"
INPUT_PATH_R="/Users/nick/Desktop/testR/"
INPUT_FILE_L="testL_%05d.tif"
INPUT_FILE_R="testR_%05d.tif"
INPUT_FPS="30"

#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

OUTPUT_PATH="/Users/nick/Desktop/output/"
OUTPUT_FILE_L="testL.webm"
OUTPUT_FILE_R="testR.webm"
OUTPUT_FPS="30"

#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

START_NUMBER="00000"
GAMMA="2.2"
SIZE="4096x2048"
BITRATE="32M"

#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~
#~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~ ~

FFMPEG_PATH="/usr/local/bin/ffmpeg"
IM_PATH=""

# This converts gamma into the values ffmpeg expects
GAMMA_FFMPEG=$(echo "1/$GAMMA" | bc -l)

# Directory where intermediate TIFF files will be stored
TEMP_DIR_L="temp_left/"
TEMP_DIR_R="temp_right/"
TEMP_PATH_L="$OUTPUT_PATH$TEMP_DIR_L"
TEMP_PATH_R="$OUTPUT_PATH$TEMP_DIR_R"
TEMP_FILE_L="$INPUT_FILE_L.tif"
TEMP_FILE_R="$INPUT_FILE_R.tif"

cd "$OUTPUT_PATH"
mkdir "$TEMP_DIR_L"
mkdir "$TEMP_DIR_R"

IMCMD_1="-gamma $GAMMA -depth 8"

FFCMD_1="$FFMPEG_PATH -y -r $INPUT_FPS -f image2 -start_number $START_NUMBER -i"
# Use this to change gamma in ffmpeg. Problematic with 32bpc.
#FFCMD_2=" -vcodec libvpx-vp9 -r $OUTPUT_FPS -pix_fmt yuv420p -vf lutrgb='y=gammaval($GAMMA_FFMPEG):u=gammaval($GAMMA_FFMPEG):v=gammaval($GAMMA_FFMPEG)' -s $SIZE -b:v $BITRATE "
FFCMD_2="-vcodec libvpx-vp9 -r $OUTPUT_FPS -pix_fmt yuv420p -s $SIZE -b:v $BITRATE"

CMD_L="cd $INPUT_PATH_L && 
for i in *.exr ; do convert \$i $IMCMD_1 $TEMP_PATH_L\$i.tif ; done && 
$FFCMD_1 $TEMP_PATH_L$TEMP_FILE_L $FFCMD_2 $OUTPUT_PATH$OUTPUT_FILE_L && 
echo * * *   LEFT: STARTING IMAGEMAGICK...   * * *"

CMD_R="cd $INPUT_PATH_R && 
for i in *.exr ; do convert \$i $IMCMD_1 $TEMP_PATH_R\$i.tif ; done && 
$FFCMD_1 $TEMP_PATH_R$TEMP_FILE_R $FFCMD_2 $OUTPUT_PATH$OUTPUT_FILE_R && 
echo * * *   RIGHT: STARTING IMAGEMAGICK...   * * *"


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