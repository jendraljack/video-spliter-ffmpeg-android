#!/system/bin/sh
redlof="$(realpath $(dirname $0))"
gol="$(ls $redlof/normaLaudio/*.log)"
oediv="$(ls $redlof/normaLaudio/*.mp4)"
####
if [ -z "$oediv" ]
then
echo "first run run-all.sh and 05move.Video.sh"
kill -9 $$
fi
####
if [ -z "$gol" ]
then
echo "first run $redlof/printDurAndBuildSrt0.sh"
kill -9 $$
fi
####
ls $redlof/normaLaudio/*.mp4 > $redlof/listmp4.log
busybox sed -i "s|_|\n|g" $redlof/listmp4.log
cat $redlof/listmp4.log|grep -v "splited.mp4" > $redlof/list2mp4.log
echo "#!/system/bin/sh" > "$0"2.sh
echo "#!/system/bin/sh" > "$0"3.sh
echo "#!/system/bin/sh" > "$0"4.sh
cat $redlof/list2mp4.log|busybox awk '{print "echo \"1v00:00:00,000 --> \" > " $0 ".srt"}' >> "$0"2.sh
cat $redlof/list2mp4.log|busybox awk '{print "ffmpeg -i \"" $0 "_splited.mp4\" 2>&1|grep Duration|busybox cut -d \x27 \x27 -f 4|busybox sed s/,// >> " $0 ".srt" }' >> "$0"3.sh
##
echo "#!/system/bin/sh" > "$0"5.sh
cat $redlof/list2mp4.log|busybox awk '{print "cat " $0 ".srt|busybox tr \x27.\x27 \x27,\x27 > " $0 "_1.srt"}' >> "$0"5.sh
#find $redlof/normaLaudio -name ".srt" -type f -exec sh "$0"5.sh {} \;
sleep 2
echo "#!/system/bin/sh" > "$0"6.sh
cat $redlof/list2mp4.log|busybox awk '{print "echo \"0\" >> " $0 "_1.srt"}' >> "$0"6.sh
sleep 2
echo "#!/system/bin/sh" > "$0"7.sh
cat $redlof/list2mp4.log|busybox awk '{print "cat " $0 "_1.srt|busybox tr \x27\\n\x27 \x27#\x27 > " $0 "_2.srt"}' >> "$0"7.sh
sleep 2
cat $redlof/list2mp4.log|busybox awk '{print "busybox sed -i \"s|#||g\" " $0 "_2.srt"}' >> "$0"4.sh
echo "#!/system/bin/sh" > "$0"8.sh
echo "#!/system/bin/sh" > "$0"9.sh
echo "#!/system/bin/sh" > "$0"10.sh
echo "#!/system/bin/sh" > "$0"11.sh
echo "#!/system/bin/sh" > "$0"12.sh
echo "#!/system/bin/sh" > "$0"13.sh
echo "#!/system/bin/sh" > "$0"14.sh
####
cat $redlof/list2mp4.log|busybox awk '{print "busybox sed -i \"s|v|\\n|g\" " $0 "_2.srt"}' >> "$0"8.sh
cat $redlof/list2mp4.log|busybox awk '{print "echo \"\" >> " $0 "_2.srt"}' >> "$0"9.sh
cat $redlof/list2mp4.log|busybox awk '{print "cat " $0 ".log|busybox tr -d [0-9] >> " $0 "_2.srt"}' >> "$0"10.sh
cat $redlof/list2mp4.log|busybox awk '{print "busybox sed -i \"s|-->||g\" " $0 ".log"}' >> "$0"11.sh
cat $redlof/list2mp4.log|busybox awk '{print "echo \"\" >> " $0 "_2.srt"}' >> "$0"12.sh
cat $redlof/list2mp4.log|busybox awk '{print "ffmpeg -i \"" $0 "_splited.mp4\" -vf subtitles=\"" $0 "_2.srt\"" ":force_style=\x27fontsize=21\x27 -preset veryfast \"\$(dirname \$0)/output/\$(basename " $0 "_splited.mp4)\"" }' >> "$0"13.sh
cat $redlof/list2mp4.log|busybox awk '{print "busybox sed -i \"s|  ||g\" " $0 "_2.srt"}' >> "$0"14.sh
echo "Spliting subrip for each timing..."
echo "echo \"\$0 executed\"" >> "$0"2.sh
/system/bin/sh "$0"2.sh
sleep 1
echo "echo \"\$0 executed\"" >> "$0"3.sh
/system/bin/sh "$0"3.sh
echo "echo \"\$0 executed\"" >> "$0"5.sh
/system/bin/sh "$0"5.sh
echo "echo \"\$0 executed\"" >> "$0"6.sh
/system/bin/sh "$0"6.sh
echo "echo \"\$0 executed\"" >> "$0"7.sh
/system/bin/sh "$0"7.sh
echo "echo \"\$0 executed\"" >> "$0"4.sh
/system/bin/sh "$0"4.sh
echo "echo \"\$0 executed\"" >> "$0"8.sh
/system/bin/sh "$0"8.sh
echo "echo \"\$0 executed\"" >> "$0"9.sh
/system/bin/sh "$0"9.sh
echo "echo \"\$0 executed\"" >> "$0"11.sh
/system/bin/sh "$0"11.sh
echo "echo \"\$0 executed\"" >> "$0"10.sh
/system/bin/sh "$0"10.sh
echo "echo \"\$0 executed\"" >> "$0"12.sh
/system/bin/sh "$0"12.sh
echo "echo \"\$0 executed\"" >> "$0"14.sh
/system/bin/sh "$0"14.sh
busybox echo -e "echo \"\$0 executed\"\nsleep 3\nrm -f \$(dirname \$(realpath \$0))/normaLaudio/*.mp4" >> "$0"13.sh
echo "$013.sh builded but you must edit srt"
if [ ! -d "$redlof/normaLaudio/finalsubrip" ]
then
mkdir $redlof/normaLaudio/finalsubrip
fi
####
mv -f $redlof/normaLaudio/*_2.srt $redlof/normaLaudio/finalsubrip
rm -f $redlof/normaLaudio/*.srt
rm -f $redlof/normaLaudio/*.log
mv -f $redlof/normaLaudio/finalsubrip/*_2.srt $redlof/normaLaudio
####
echo "$0 ok."
