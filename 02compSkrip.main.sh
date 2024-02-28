#!/system/bin/sh
cwd="$(realpath $(dirname $0))"
echo "build skrip ffmpeg video spliter\nWait..."
ls $cwd/txt/*.txt > $cwd/list.txt
#" -exec /system/bin/sh "$cwd"/builderSplit.sh {} \;
cat $cwd/list.txt|busybox awk -v script=$cwd/builderSplit.sh '{print "sh " script " " $0}' > $cwd/buildsksh.sh
sh $cwd/buildsksh.sh
echo "oke..."
echo "$(basename $0) executed.."
