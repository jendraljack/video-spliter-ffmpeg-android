#!/system/bin/sh
if [ -z "$1" ]
then
echo "Gunakan: $0 srt.log"
kill -9 $$
fi

if [ ! -e "$(dirname $(realpath $0))/sksh" ]
then
mkdir $(dirname $(realpath $0))/sksh
fi
#### pemisah video menurut waktu pada subtitle ####
#### jika audio/video di backmasking di atas 1 detik, unggah ke youtube. hasilnya akan lolos hak cipta ####
echo "Executing $(basename $0) .."
cat "$@"|busybox awk '{print "#!/system/bin/sh\n" "jam=\$((3600000*" $1 "))\n" "menit=\$((60000*" $2 "))\n" "detik=\$((1000*" $3 "))\n" "start=\$((\$jam+\$menit+\$detik+" $4 "))\n" "###\n" "maj=\$((3600000*" $5 "))\n" "tinem=\$((60000*" $6 "))\n" "kited=\$((1000*" $7 "))\n" "end=\$((\$maj+\$tinem+\$kited+" $8 "))\n" "dur=\$((\$end-\$start))\n" "t=\"\$(busybox awk -v rud=\$dur \x27BEGIN {print rud/1000}\x27)\"\nffmpeg -ss " $1 ":" $2 ":" $3 "." $4 " -t \"\$t\" -i \"\$@\" -c copy \$(dirname \"\$@\")/output/" $1$2$3$4 "_splited.mp4" }' > $(dirname $(realpath $0))/sksh/$(date +%s)-$(basename $@).sh
#sleep 1
echo "$0 executed..."
