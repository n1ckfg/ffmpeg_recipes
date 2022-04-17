ffmpeg -y -i $PWD"/"$1 -aspect 16:9 -target ntsc-dvd dvd.mpg

rm -rf dvd
mkdir dvd

export VIDEO_FORMAT=NTSC
dvdauthor -o dvd/ -t dvd.mpg
dvdauthor -T -o dvd/
genisoimage -dvd-video -o dvd.iso dvd/
