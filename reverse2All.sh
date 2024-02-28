#!/system/bin/sh
reversedir="$(dirname $(realpath $0))"
if [ ! -f "$reversedir/reverseAV_All.sh" ]
then
echo "No files ./reverseAV_All.sh"
kill -9 $$
fi
####
if [ ! -f "$reversedir/reverseOnlyVideo-All.sh" ]
then
echo "No files ./reverseOnlyVideo-All.sh"
kill -9 $$
fi
###
 if [ ! -f "$reversedir/convert2ts.All.sh" ]
then
echo "No files ./convert2ts.All.sh"
kill -9 $$
fi
###
/system/bin/sh $reversedir/nonReverseAll.sh
sleep 1
/system/bin/sh $reversedir/reverseAV_All.sh
sleep 2
/system/bin/sh $reversedir/reverseOnlyVideo-All.sh
sleep 2
/system/bin/sh $reversedir/convert2ts.All.sh
sleep 2

#ls $reversedir/*.mkv > $reversedir/mkv.log
#cat $reversedir/mkv.log|busybox awk '{print "#!/system/bin/sh\nffmpeg -i " $0 " -preset medium " $0 "_output.mp4\nsleep 2\nrm " $0}' > $reversedir/mkvToMp4.sh
rm -f $reversedir/normaLaudio/*.srt

####
busybox echo -e "$(basename $0) executed...\nEnjoy."
