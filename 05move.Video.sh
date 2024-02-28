#!/system/bin/sh
cdr="$(dirname $(realpath $0))"
#subrip="$@"
if [ ! -d "$cdr/normaLaudio" ]
then
mkdir "$cdr"/normaLaudio
fi


############################
#ls $cdr/*.srt
#echo "Select 1 srt at above for sortir your video. (without path)... "
#read subrip
# case $subrip in
  #"*.srt");;
 # esac;
###
if [ -z "$1" ]
then
echo "usage: $0 /path/subrip"
kill -9 $$
fi

cat "$@"|grep -e "-->" > "$cdr"/splited.log
echo "#!/system/bin/sh" > "$cdr"/moveOnlyVocal.sh
busybox sed -i "s|:| |g" "$cdr"/splited.log
busybox sed -i "s|,| |g" "$cdr"/splited.log
# skrip serentak pemisah video menurut waktu di subtitle.srt
cat "$cdr"/splited.log|busybox awk '{print "if [ -f \"\$(dirname \$(realpath \$0))/output/" $1$2$3$4 "_splited.mp4\" ]\nthen\n" "mv \$(dirname \$(realpath \$0))/output/" $1$2$3$4 "_splited.mp4" " \$(dirname \$(realpath \$0))/normaLaudio/" $1$2$3$4 "_splited.mp4\nfi"}' >> "$cdr"/moveOnlyVocal.sh
sleep 2
####
video="$(ls $cdr/output/*.mp4)"
if [ -z "$video" ]
then
echo "No video in $cdr/output"
kill -9 $$
fi
/system/bin/sh "$cdr"/moveOnlyVocal.sh
####
echo "$(basename $0) executed.."
