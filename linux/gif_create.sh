ffmpeg -i $1 $1_step1.gif 
#convert $1_step1.gif -verbose -coalesce -layers OptimizeFrame $1_step2.gif
#gifsicle -O2 $1_step2.gif -o $1_step3.gif
gifsicle -O2 $1_step1.gif -o $1_step2.gif


