@echo off

set VIDEO_INPUT_FILE="%~1"

rem https://forum.videohelp.com/threads/388428-Cinepak-video-encoding
rem Lower is better, upper bound of scale for Cinepak unknown. Values observed are 8 and 16. 
set PROFILE=500
rem set FPS=15/1

set VIDEO_INPUT_PATH=%~dp1

set VIDEO_OUTPUT_EXTENSION=_cinepak.mov
set VIDEO_OUTPUT_FILE=%VIDEO_INPUT_FILE%%VIDEO_OUTPUT_EXTENSION%

set FFMPEG_PATH=C:\Util\ffmpeg\bin\ffmpeg

set VPROC="pp=ac,pp=ac,pp=ac,hqdn3d=5,eq=contrast=256/220:brightness=1/512:saturation=256/224:gamma=16/16,scale=320:-4:sws_flags=spline+accurate_rnd+full_chroma_int+full_chroma_inp,minterpolate=fps=%fps%:mi_mode=mci:me_mode=bidir:me=ntss:vsbmc=1,xbr=2,scale=320:-4:sws_flags=spline+accurate_rnd+full_chroma_int+full_chroma_inp:sws_dither=2:in_range=0:out_range=2,format=pix_fmts=rgb24,pad=320:240:(ow-iw)/2:(oh-ih)/2"
set APROC="pan=mono|FC < 1.414FC+FR+FL+0.5BL+0.5SL+0.25LFE+0.125BR,firequalizer=gain='if(gte(f,25),0,-INF)+if(lte(f,11024),0,-INF)',dynaudnorm=p=1/sqrt(2):m=100:s=20,firequalizer=gain='if(gte(f,25),0,-INF)+if(lte(f,11024),0,-INF)',aresample=resampler=soxr:osr=22050:cutoff=0.990:dither_method=shibata"


rem using without resizing requires height and width be multiples of 4
rem %FFMPEG_PATH% -y -threads 3 -i %VIDEO_INPUT_FILE% -c:v cinepak -q:v %PROFILE% -c:a pcm_s8 -threads 3 -cpu-used 2 %VIDEO_OUTPUT_FILE%
%FFMPEG_PATH% -y -threads 3 -i %VIDEO_INPUT_FILE% -vf %VPROC% -c:v cinepak -q:v %PROFILE% -af %APROC% -c:a pcm_s8 -threads 3 -cpu-used 2 %VIDEO_OUTPUT_FILE%

@pause