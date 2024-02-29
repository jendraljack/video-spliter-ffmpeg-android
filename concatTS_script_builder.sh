#!/system/bin/sh
conc="$(dirname $(realpath $0))"
check="$(ls $conc/rev/*.ts)"
if [ -z "$check" ]
then
echo "Please Convert mp4 to ts first if available.."
kill -9 $$
fi

ls $conc/rev/*.ts > $conc/0con.log
echo "#!/system/bin/sh" > $conc/header
str0="ffmpeg -i \"concat:"
str1="$(cat $conc/0con.log)"
str2="\" -c copy \$(dirname \$(realpath \$0))/$(date +%s).mkv"
busybox echo -n $str1 > $conc/conlog2.txt
busybox sed -i "s| |\||g" $conc/conlog2.txt
###
str3="$(cat $conc/conlog2.txt)"
#busybox sed -i "s|\|x|\" -c copy |g" $conc/1con.log
#busybox sed -i "s|4\||mkv|g" $conc/1con.log
cat $conc/header > $conc/mergeTs.sh
#echo "$str0" >> "mergeTs.sh"
echo -n $str0$str3$str2 >> $conc/mergeTs.sh
sleep 3
/system/bin/sh "$conc/mergeTs.sh"
echo "0ke..."
